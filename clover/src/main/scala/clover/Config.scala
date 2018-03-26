package clover

import clover.datastores.InfluxDBStore

object Config {

  def metricSources(): List[MetricSource] = {
    List(
      MetricSource(
        new InfluxDBStore("18.233.132.222", 8086, "traffic_simulator").connect(),
        List(
          Measurement("requests", "durationInMillis")
        )
      ),
      MetricSource(
        new InfluxDBStore("18.233.132.222", 8086, "telegraf").connect(),
        List(
          Measurement("cpu", "usage_guest"),
          Measurement("cpu", "usage_guest_nice"),
          Measurement("cpu", "usage_idle"),
          Measurement("cpu", "usage_iowait"),
          Measurement("cpu", "usage_irq"),
          Measurement("cpu", "usage_nice"),
          Measurement("cpu", "usage_softirq"),
          Measurement("cpu", "usage_steal"),
          Measurement("cpu", "usage_system"),
          Measurement("cpu", "usage_user")
        )
      )

    )
  }

  def cloverStore(): InfluxDBStore = {
    new InfluxDBStore("localhost", 8086, "clover").connect()
  }

}
