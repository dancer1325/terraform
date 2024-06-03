# Goal
* main components
* how data & requests (main `terraform ...`) -- flow between -- components?

# CLI
* Command implementations
  * in 'internal/command/' -- [Link](https://pkg.go.dev/github.com/hashicorp/terraform/internal/command) --
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
  * -- via mapping table to -- operation
  * implementation of `backend.Backend`
* `backend.Enhanced`
  * requirements
    * Backend is able to execute operations
  * types
    * `local`
    * Terraform Cloud ones
      * `remote`
      * `cloud` 
* how does it work?
  * operation got -> it's executed
  * `configs.Config` + Operation arguments + `terraform.State` -> build `terraform.Context`
  * begin the execution

# State Manager
* allows
  * based on the workspace specified in the Operation -> retrieve / store the current state (serialized)
* == implementation of some combination of interfaces in '/internal/statemgr/'
  * most of them implement 'statemgr.Full' -- provided by a Backend --
  * smaller interfaces -- make explicit -- the actions / function can take on the state manager
* available ones
  * if local backend is used directly -> 'statemgr.Filesystem'
    * responsible of `terraform.State`
  * else -> Backend's implementation of 'statemgr.Filesystem'
    * responsible for remote state
* 'states.State'
  * := object to handle the state snapshot
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
  * -- produces a -- graph == `terraform.Graph`
* allows
  * representing the necessary steps / that operation
    * 1! graph builder / operation
      * _Example1:_ graph build for `plan` -- starts from -- configuration
      * _Example2:_ graph build for `apply` -- starts from -- changes described in the `plan`
  * relation between the steps
* == sequence of _transforms_
  * _transform_ 
    * == implementations of `terraform.GraphTransformer`
      * == mutations of a graph
      * _Example1:_ `ConfigTransformer` -- 1! vertex / `resource` in the configuration --
      * _Example2:_ `StateTransformer` -- 1! vertex / `resource` instance tracked in the state --
      * _Example3:_ `ReferenceTransformer` -- find dependencies between `resource` & create any necessary edges --
      * _Example4:_ `ProviderTransformer` -- 1! `resource` / provider configuration & create edges / providers initialized before taking any actions --
* the vertex
  * == 1!object
    * / configuration OR
      * _Example:_ `resource` -- has a corresponding -- [GraphNodeConfigResource](https://pkg.go.dev/github.com/hashicorp/terraform/internal/terraform#GraphNodeConfigResource)
    * -- derived from that -- configuration
* the edges
  * == "must happen after" relationships
    * -> define the order to evaluate the vertexes

# Graph Walk
* == graph walk algorithm
* allows
  * processing of walking the `terraform.Graph`
  * if it's possible -> evaluate multiple vertexes concurrently
* `terraform.ContextGraphWalker`
  * := Walk functionality / small set of higher-level operations
    * `EnterPath`
      * invoked 1! / module in the configuration
      * from module address -- returns -> `terraform.EvalContext` / 
        * := context / 
          * process within 1! module
          * track objects within module
        * != `terraform.Context`

# Vertex Evaluation
* TODO:



# Note
* 'architecture-overview.png'
  * == flow / applies to the main Terraform workflow commands
    * _Example:_ `terraform plan` OR `terraform apply`
* operation
  * == actionToTake + workspaceNameWhereTheActionIsTaken + rootModuleInputVariables + ifPlanPathToRootModuleConfiguration + ifApplyPlan + otherOptionsOrSettings
* `terraform.Context`
  * := main object / performs Terraform operations
* graph
  * == steps of the operation + dependency relation between steps
  * vertices or nodes
    * == specific object in the configuration
      * _Example:_ `resource` block
  * edges
    * == "must happen after" relationships
      * == order / vertices are evaluated

* TODO:
