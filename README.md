# InfluxDB User and Database Management Script

This Bash script simplifies the management of InfluxDB v1 users, authentication, and database retention policy (DBRP) mappings. It offers a menu to create or delete users and databases, as well as view lists of existing users and databases.

## Features

1. **Create User and Database**:
   - Create a user with read/write permissions for a specific bucket.
   - Map a database to a bucket with a default retention policy.

2. **Delete User and Database**:
   - Delete an existing user and its associated database retention policy mapping.

3. **View List of Users and Databases**:
   - View a list of all users and DBRP (database) mappings associated with a specific organization.

## Retention Policy Options

The script uses a fixed retention policy by default (`autogen`), but you can modify it in the script. Below are the common options for retention policy:

- `autogen`: Default retention policy.
- `1h`: Retain data for 1 hour.
- `1d`: Retain data for 1 day.
- `7d`: Retain data for 7 days.
- `30d`: Retain data for 30 days.
- `inf`: Infinite retention (never delete data).

To change the retention policy, modify the `RETENTION_POLICY` variable in the script:

```bash
RETENTION_POLICY="7d"  # Example for 7-day retention
```
## Usage
1. **Clone or Download the Script**
Save the script as manage_influx_auth.sh on your system.

2. **Make the Script Executable**
Run the following command to make the script executable:

```bash
chmod +x manage_influx_auth.sh
```

3. **Run the Script**
To run the script, use:

```bash
./manage_influx_auth.sh
```

You will be presented with a menu with the following options:

**Create User and Database**: Input your Bucket ID, Username, and Database Name to create a new user with database retention policy mapping.
**Delete User and Database**: Input the Username and Database Name to delete a user and its associated retention policy mapping.
**View List of Users and Databases**: Shows a list of existing users and database retention policy mappings in the organization.
## Example Workflow
**Create a User and Database**
1. Run the script:
```bash
./manage_influx_auth.sh
```
2. Choose option 1 to create a user and database.
3. Provide the following inputs:
    * Bucket ID
    * Username
    * Database Name
## View Users and Databases
1. Run the script and select option 3.
2. The script will display the current list of users and database retention policies.
## Delete a User and Database
1. Run the script and choose option 2.
2. Provide the Username and Database ID to remove them.

## Customization
 * Organization: The default organization is set to BTJP. You can change this by modifying the ORG variable in the script:
```bash
ORG="YourOrganizationName"
```
**Retention Policy**: Modify the RETENTION_POLICY variable to set different retention durations (e.g., RETENTION_POLICY="30d" for 30 days).

## Dependencies
Make sure you have the [InfluxDB CLI](https://docs.influxdata.com/influxdb/cloud/reference/cli/influx/) installed and properly configured in your environment.

Install InfluxDB CLI:
To install the InfluxDB CLI, follow [official installation guide.](https://docs.influxdata.com/influxdb/cloud/).

## Error Handling
If you encounter issues, ensure that:

 * You have the correct permissions to run InfluxDB CLI commands.
 * The InfluxDB service is running and properly configured.




