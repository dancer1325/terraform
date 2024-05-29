* `terraform refresh [options]`
  * allows
    * reading current settings -- from -- ALL managed remote objects
    * updating Terraform state -- NOT recommended!! --
      * 
  * uses
    * backward compatibility
  * == `terraform apply --refresh-only -auto-approve`
    * `terraform apply -refresh-only` -- RECOMMENDED!! --
* TODO: