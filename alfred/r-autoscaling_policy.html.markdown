resource "aws_autoscaling_policy" "bat" {
  name                   = "foobar3-terraform-test"
  scaling_adjustment     = 4
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.bar.name}"
}

resource "aws_autoscaling_group" "bar" {
  availability_zones        = ["us-east-1a"]
  name                      = "foobar3-terraform-test"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.foo.name}"
}

step_adjustment {
  scaling_adjustment          = -1
  metric_interval_lower_bound = 1.0
  metric_interval_upper_bound = 2.0
}

step_adjustment {
  scaling_adjustment          = 1
  metric_interval_lower_bound = 2.0
  metric_interval_upper_bound = 3.0
}

target_tracking_configuration {
  predefined_metric_specification {
    predefined_metric_type = "ASGAverageCPUUtilization"
  }

  target_value = 40.0
}

target_tracking_configuration {
  customized_metric_specification {
    metric_dimension {
      name  = "fuga"
      value = "fuga"
    }

    metric_name = "hoge"
    namespace   = "hoge"
    statistic   = "Average"
  }

  target_value = 40.0
}
