# GithubSuperApp

This is the Compass Github Super App project.

This project should only be used for testing during development and for deployment to production when a release is ready to go to production.

## Initial Setup

You need to create the `GlobalConstants.swift` file at the root of the project for it to compile successfully.

- Note: You should contact your squad's Tech Lead to obtain the values for `clientAPIToken` and `clientSecret`.

- Warning: Since this is an open-source project, **NEVER** use the actual GlobalConstants in the origin.

```swift
import GithubKit

struct GlobalConstants: GithubKit.GlobalConstants {

    let clientAPIToken: String = /* Github Client Token */
    let clientSecret: String = /* Github Client Secret */
}
```

## Points of Attention

### Milestone

Use milestones to keep track of what is being shipped in each version.

### Read-only

Avoid making changes to the Super App as much as possible. Whenever a change is necessary, it should be clarified to the team with all the technical details of the change.
