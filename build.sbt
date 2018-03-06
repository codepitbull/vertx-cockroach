import sbt.Package._
import sbt._
import Docker.autoImport.exposedPorts

scalaVersion := "2.12.4"

enablePlugins(DockerPlugin)
exposedPorts := Seq(8666)

libraryDependencies ++= Vector (
  Library.vertx_lang_scala,
  Library.vertx_web,
  Library.vertx_mysql_postgresql_client,
  Library.scalaTest       % "test",
  // Uncomment for clustering
  // Library.vertx_hazelcast,
  "org.slf4j" % "slf4j-api" % "1.7.25",
  "ch.qos.logback" % "logback-classic" % "1.2.3",
  "org.jooq" %% "jooq-scala" % "3.10.5",
  "org.jooq" % "jooq-codegen" % "3.10.5",
  "org.postgresql" % "postgresql" % "42.1.1",
  //required to get rid of some warnings emitted by the scala-compile
  Library.vertx_codegen
)

packageOptions += ManifestAttributes(
  ("Main-Verticle", "scala:de.codepitbull.vertx.scala.cockroach.HttpVerticle"))

