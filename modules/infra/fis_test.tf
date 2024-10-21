data "aws_iam_role" "fis_role" {
  name = var.fis_role_name
}

resource "aws_fis_experiment_template" "disk_fill_experiment" {
  description = var.fis_experiment_description
  role_arn    = data.aws_iam_role.fis_role.arn

  stop_condition {
    source = "none"
  }

  action {
    name        = "diskfill_test"
    action_id   = "aws:ssm:send-command"
    description = "Fill disk on target EC2 instances"

    parameter {
      key   = "documentArn"
      value = "arn:aws:ssm:ap-south-1::document/AWSFIS-Run-Disk-Fill"
    }

    parameter {
      key   = "documentParameters"
      value = jsonencode({
        DurationSeconds     = tostring(var.fis_disk_fill_duration)
        Percent             = tostring(var.fis_disk_fill_percentage)
        InstallDependencies = "True"
      })
    }

    parameter {
      key   = "duration"
      value = "PT10M"
    }

    target {
      key   = "Instances"
      value = "Instances-Target-1"
    }
  }

  target {
    name           = "Instances-Target-1"
    resource_type  = "aws:ec2:instance"
    selection_mode = "COUNT(1)"

    filter {
      path   = "State.Name"
      values = ["running"]
    }

     resource_tag {
      key   = "Name"
      value = "ltemp-web"
    }
  }

  log_configuration {
    log_schema_version = 2
    cloudwatch_logs_configuration {
      log_group_arn = "enter your arn"
    }
  }
}