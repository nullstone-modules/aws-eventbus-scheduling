This capability provides the necessary env variables in order to create schedules for the connected AWS EventBridge EventBus.

The env variables injected are:
| Variable | Description |
| --- | --- |
| `EVENTBUS_ARN` | The arn of the AWS EventBridge EventBus. |
| `EVENTBUS_NAME` | The name of the AWS EventBridge EventBus. |
| `EVENTBUS_SCHEDULER_GROUP_NAME` | The name of the scheduler group used as the landing zone for creating schedules. |
| `EVENTBUS_SCHEDULER_ROLE_ARN` | The arn of the IamRole to use when creating schedules. This role has all the permissions required to create a schedule. |
