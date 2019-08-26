resource "aws_autoscaling_policy" "scale_up" {
  name                   = "${var.resources_prefix}-cpu-scale-up"
  scaling_adjustment     = var.up_adjustment
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = var.asg_name
}

resource "aws_cloudwatch_metric_alarm" "scale_up" {
  alarm_name          = "${var.resources_prefix}-cpu-scale-up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.up_eval_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.up_period
  statistic           = "Average"
  threshold           = var.up_threshold

  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.scale_up.arn]
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "${var.resources_prefix}-cpu-scale-down"
  scaling_adjustment     = var.down_adjustment
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = var.asg_name
}

resource "aws_cloudwatch_metric_alarm" "scale_down" {
  alarm_name          = "${var.resources_prefix}-cpu-scale-down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.down_eval_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.down_period
  statistic           = "Average"
  threshold           = var.down_threshold

  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.scale_down.arn]
}
