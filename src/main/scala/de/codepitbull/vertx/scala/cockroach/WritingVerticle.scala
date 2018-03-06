package de.codepitbull.vertx.scala.cockroach

import de.codepitbull.vertx.scala.jooq.tables.tables.Logs._
import io.vertx.lang.scala.ScalaVerticle
import io.vertx.lang.scala.json.Json
import io.vertx.scala.ext.asyncsql.{AsyncSQLClient, PostgreSQLClient}
import org.jooq.SQLDialect
import org.jooq.impl.DSL._

import scala.concurrent.Future
import scala.util.Success

class WritingVerticle extends ScalaVerticle{
  private val Dialect = SQLDialect.POSTGRES_9_5

  override def start(): Unit = {

    val postgreSQLClientConfig = Json.obj("host" -> "192.168.6.7", "port" -> 26257, "username" -> "root", "sslMode" -> "disable", "database" -> "vertx_test")
    implicit val postgreSQLClient = PostgreSQLClient.createShared(vertx, postgreSQLClientConfig)

    fetchStartId()
      .onComplete{ case Success(startId) => startProcessing(startId) }

  }

  def fetchStartId()(implicit postgreSQLClient: AsyncSQLClient): Future[Int] = {
    val getMaxId = using(Dialect)
      .select(LOGS.ID.max())
      .from(LOGS)

    postgreSQLClient
      .querySingleFuture(getMaxId.getSQL)
      .map(arr => if (arr.isEmpty) 0 else arr.getInteger(0).toInt)
  }

  def startProcessing(startId: Int)(implicit postgreSQLClient: AsyncSQLClient) {

    var currentId = startId

    val q = using(Dialect)
      .insertInto(LOGS)
      .columns(LOGS.ID, LOGS.LOG)
      .values(0l, "")

    vertx
      .periodicStream(100)
      .handler(_ => {
          currentId = currentId + 1
          postgreSQLClient.updateWithParamsFuture(q.getSQL, Json.arr(currentId, "Very important log message!"))
        }
      )
  }
}
