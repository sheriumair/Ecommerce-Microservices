#!/bin/bash

# Function to start a Spring Boot service
start_service() {
  local service_name=$1
  echo "Starting $service_name..."
  (cd "$service_name" && mvn spring-boot:run > "../logs/$service_name.log" 2>&1 &)
}

# Create a logs directory if not exists
mkdir -p logs

# List of microservices (replace these paths with your actual service directories)
SERVICES=(
  "service1"  # Replace with the directory of service 1
  "service2"  # Replace with the directory of service 2
  "service3"  # Replace with the directory of service 3
)

# Loop through each service and start it
for SERVICE in "${SERVICES[@]}"; do
  start_service "$SERVICE"
done

echo "All services are starting... Logs are stored in the 'logs' folder."
