* Workspaces
  * (in Terraform CLI)
    * := separate instances of state data / same Terraform working directory
      * resources -- via state, are associated with -- real-world objects
    * != workspaces in HCP Terraform
  * use cases
    * create different sets of infrastructure / same
      * configuration
      * plugin
      * module caches
    * different stages / same infrastructure
    * feature branch approach / same infrastructure
  * NOT use cases
    * manage large systems -> separate Terraform configurations
    * infrastructure / different credentials & AC
* TODO: