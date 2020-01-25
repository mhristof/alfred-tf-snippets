resource "aws_glue_trigger" "example" {
  name          = "example"
  type          = "CONDITIONAL"

  actions {
    job_name = "${aws_glue_job.example1.name}"
  }

  predicate {
    conditions {
      job_name = "${aws_glue_job.example2.name}"
      state    = "SUCCEEDED"
    }
  }
}

resource "aws_glue_trigger" "example" {
  name = "example"
  type = "ON_DEMAND"

  actions {
    job_name = "${aws_glue_job.example.name}"
  }
}

resource "aws_glue_trigger" "example" {
  name     = "example"
  schedule = "cron(15 12 * * ? *)"
  type     = "SCHEDULED"

  actions {
    job_name = "${aws_glue_job.example.name}"
  }
}

resource "aws_glue_trigger" "example" {
  name = "example"
  type = "CONDITIONAL"

  actions {
    crawler_name = "${aws_glue_crawler.example1.name}"
  }

  predicate {
    conditions {
      job_name = "${aws_glue_job.example2.name}"
      state    = "SUCCEEDED"
    }
  }
}

resource "aws_glue_trigger" "example" {
  name = "example"
  type = "CONDITIONAL"

  actions {
    job_name = "${aws_glue_job.example1.name}"
  }

  predicate {
    conditions {
      crawler_name = "${aws_glue_crawler.example2.name}"
      crawl_state    = "SUCCEEDED"
    }
  }
}
