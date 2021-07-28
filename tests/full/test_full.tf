terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  name = "FEX1"
}

data "aci_rest" "infraFexP" {
  dn = "uni/infra/fexprof-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "infraFexP" {
  component = "infraFexP"

  equal "name" {
    description = "name"
    got         = data.aci_rest.infraFexP.content.name
    want        = module.main.name
  }
}

data "aci_rest" "infraFexBndlGrp" {
  dn = "${data.aci_rest.infraFexP.id}/fexbundle-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "infraFexBndlGrp" {
  component = "infraFexBndlGrp"

  equal "name" {
    description = "name"
    got         = data.aci_rest.infraFexBndlGrp.content.name
    want        = module.main.name
  }
}
