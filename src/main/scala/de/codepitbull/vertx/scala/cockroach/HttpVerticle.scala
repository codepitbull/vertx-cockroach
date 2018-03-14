package de.codepitbull.vertx.scala.cockroach

import java.util.UUID

import io.vertx.lang.scala.ScalaVerticle
import io.vertx.scala.ext.web.Router
import io.vertx.scala.ext.web.handler.BodyHandler

import scala.util.{Failure, Success}

class HttpVerticle extends ScalaVerticle{
  override def start(): Unit = {
    val router = Router.router(vertx)
    router.get("/reply").handler(req => req.response().write("I am here"))
    router.post("/upload").handler(BodyHandler.create())
    router.post("/upload").handler((ctx) => {
      ctx.fileUploads().foreach(upload => {
        vertx.fileSystem().moveFuture(upload.uploadedFileName(), s"/mnt/uploads/${UUID.randomUUID().toString}").onComplete{
          case Success(_) => ctx.response().end("Success!")
          case Failure(t) => ctx.response().setStatusCode(503).end(t.toString)
        }
      })
    })

    vertx
      .createHttpServer()
      .requestHandler(router.accept _)
      .listenFuture(8080, "0.0.0.0")
  }
}