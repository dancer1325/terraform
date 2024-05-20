# CLI
* Command implementations
  * in 'internal/command/'
  * how does it work?
    * read CL's arguments / options & environment variables
    * produce a `backend.Operation` object
    * operation -- is passed to -- current selected backend 
* 'commands.go'
  * map command names -> 'command' package

# Backend
* := Terraform feature / plugin which
  * determines the path in which Terraform stores its state snapshots
* 's name
  * operation -- via mapping table map to -- name
  * implementation of `backend.Backend`
* / perform operations
  * `local`
    * -> rest of backends -- are wrapped in an -- instance of `local.Local` 
  * Terraform Cloud ones
    * `remote`
    * `cloud`
* `backend.Enhanced`
  * requirements
    * Backend is able to execute operations 
* how does it work?
  * operation got -> it's executed
  * `configs.Config` + Operation arguments + `terraform.State` -> build `terraform.Context`
  * begin the execution

# State Manager
* allows
  * based on the workspace specified in the Operation -> retrieve / store the current state
* == implementation of some combination of interfaces in '/internal/statemgr/'
  * most of them implement 'statemgr.Full' -- provided by a Backend --
  * smaller interfaces -- make explicit -- the actions / function can take on the state manager
* available ones
  * if local backend is used directly -> 'statemgr.Filesystem'
    * responsible of `terraform.State`
  * else -> Backend's implementation of 'statemgr.Filesystem'
    * responsible for remote state
* 'states.State'
  * := object to handle the state
  * == blob store

# Configuration Loader
* 'configs' 
  * 'configs/configload'
    * main entry point -- via -- 'configload.Loader'
      * loader
        * steps
          * handles the installation of child modules -- during `terraform init` --
          * generate 1! configs.Config
          * once the configuration is loaded by a backend -> locate again those modules
  * 'configs.Config'
    * := model which represents all the module
  * low-level functionality / -- constructs -- configuration objects
  * some parts of the configuration -- depend on -- other configuration's outcome
    * ->
      * are interpreted during graph build or graph walk
      * are represented by low-level HCL types
* allows
  * about configuration of the Operation
    * load
    * process
    * validate

# Graph Builder
* steps
  * -- invoked by -- `terraform.Context`'s method
  * -- produces a -- graph

# Note
* 'architecture-overview.png'
  * == flow / applies to the main Terraform workflow commands
    * _Example:_ `terraform plan` OR `terraform apply`
* operation
  * == actionToTake + workspaceNameWhereTheActionIsTaken + rootModuleInputVariables + ifPlanPathToRootModuleConfiguration + ifApplyPlan + otherOptionsOrSettings
* `terraform.Context`
  * := main object / performed by Terraform operations
* graph
  * == steps of the operation + dependency relation between steps
  * vertices or nodes
    * == specific object in the configuration
      * _Example:_ `resource` block
  * edges
    * == "must happen after" relationships
      * == order / vertices are evaluated

* TODO:
