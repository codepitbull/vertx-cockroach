package de.codepitbull.vertx.scala.cockroach

import io.vertx.lang.scala.ScalaVerticle
import io.vertx.scala.core.Vertx

object HttpVerticleMain {

  /**
    * dd if=/dev/random of=sample.txt bs=1048576 count=1
    * curl -F "file=@sample.txt;filename=muahahaha" http://localhost:8080/upload
    *
    */
  def main(args: Array[String]): Unit = {
    val vertx = Vertx.vertx()
    vertx.deployVerticle(ScalaVerticle.nameForVerticle[HttpVerticle])
  }

}
