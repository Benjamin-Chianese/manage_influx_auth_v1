#!/bin/bash

# Fixed values for organization and retention policy
ORG="ORG"
RETENTION_POLICY="autogen"  # Change this if you want a different retention policy

# Retention Policy Options (for your reference):
# - autogen: Default retention policy in InfluxDB
# - 1h: Keep data for 1 hour
# - 1d: Keep data for 1 day
# - 7d: Keep data for 7 days
# - 30d: Keep data for 30 days
# - inf: Infinite retention (never delete data)
# Example of setting a retention policy: RETENTION_POLICY="7d" for a 7-day retention

# Function to create user and database
create_user_and_db() {
    # Prompt the user for the required values
    read -p "Enter the bucket ID: " BUCKET_ID
    read -p "Enter the username: " USERNAME
    read -p "Enter the database name: " DB_NAME

    # Create InfluxDB v1 authentication for the user with read/write permissions on the bucket
    influx v1 auth create \
      --read-bucket "$BUCKET_ID" \
      --write-bucket "$BUCKET_ID" \
      --username "$USERNAME"

    # Create a Database Retention Policy (DBRP) mapping for the bucket
    influx v1 dbrp create \
      --bucket-id "$BUCKET_ID" \
      --db "$DB_NAME" \
      --rp "$RETENTION_POLICY" \
      --default \
      --org "$ORG"

    echo "User and DB created successfully!"
}

# Function to delete user and database
delete_user_and_db() {
    # Prompt the user for the username and database to delete
    read -p "Enter the username to delete: " USERNAME
    read -p "Enter the database id to delete: " DB_ID

    # Delete the user
    echo "Deleting user..."
    influx v1 auth delete --username "$USERNAME"

    # Delete the DBRP (database retention policy mapping)
    echo "Deleting database retention policy mapping..."
    influx v1 dbrp delete --id "$DB_ID"

    echo "User and DB deleted successfully!"
}

# Function to view list of users and databases
view_lists() {
    echo "List of users:"
    influx v1 auth list

    echo "List of DBRPs (Databases):"
    influx v1 dbrp list --org "$ORG"
}

# Main menu for user choice
echo "Select an option:"
echo "1. Create user and database"
echo "2. Delete user and database"
echo "3. View list of users and databases"
read -p "Enter your choice (1/2/3): " CHOICE

case $CHOICE in
    1)
        create_user_and_db
        ;;
    2)
        delete_user_and_db
        ;;
    3)
        view_lists
        ;;
    *)
        echo "Invalid option. Please select 1, 2, or 3."
        ;;
esac
