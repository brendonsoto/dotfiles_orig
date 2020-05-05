:elixir:

# Supervisors
Supervisors belong to the OTP framework
Supervisors are in charge of monitoring and restarting processes
Supervisors can manage other supervisors

Under the hood supervisors utilize process-linking and monitoring
Think back to using functions like `spawn_link` or `monitor_link`

To add basic supervisors template to a new project use `mix new --sup <project-name>`

# List of supervisor strategies

## :one_for_one
Only restart the failed process

## :one_for_all
Restart all processes

## :rest_for_one
Restart the process and any processes after it
