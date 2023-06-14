provider "aws" {
  region = var.region
  shared_credentials_files = var.credentials
}

module "vpcmodule" {
  source               = "./vpc"
  namevpc              = var.namevpc
  ipcidr               = var.ipcidr
  public1_subnet_cidrs = var.public1_subnet_cidrs
  public_az1           = var.public_az1
  namepublicsubnet1    = var.namepublicsubnet1
  public2_subnet_cidrs = var.public2_subnet_cidrs
  public_az2           = var.public_az2
  namepublicsubnet2    = var.namepublicsubnet2
  private_az           = var.private_az
  private_subnet_cidrs = var.private_subnet_cidrs
  nameprivatesubnet    = var.nameprivatesubnet
  nameinternetgw       = var.nameinternetgw
  nameroutetable       = var.nameroutetable
  namesg               = var.namesg
  ingress              = var.ingress
}

module "ec2module" {
    source = "./ec2"
    depends_on = [
      module.vpcmodule
    ]
    publicsubnet1_id = module.vpcmodule.publicsubnet1_id
    publicsubnet2_id = module.vpcmodule.publicsubnet2_id
    sgid = [module.vpcmodule.sgid]
    ami = var.ami
    instype = var.instype
    keyssh = var.keyssh
    nameins = var.nameins

}
