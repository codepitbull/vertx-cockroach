package de.codepitbull.vertx.scala.cockroach

import io.vertx.lang.scala.ScalaVerticle
import io.vertx.scala.core.Vertx

object WritingVerticleMain {

  def main(args: Array[String]): Unit = {
    val vertx = Vertx.vertx()
    vertx.deployVerticle(ScalaVerticle.nameForVerticle[WritingVerticle])
  }

}
