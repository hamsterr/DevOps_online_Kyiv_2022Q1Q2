[
    {
      "essential": true,
      "memory": 128,
      "name": "slave-${app_name}-${env}",
      "cpu": 10,
      "image": "${ecr_url}:${app_tag}",
      "portMappings": [
        {
          "hostPort": 0,
          "protocol": "tcp",
          "containerPort": 80
        }
      ],
      "environment": []
    }
  ]