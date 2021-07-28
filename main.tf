resource "aci_rest" "infraFexP" {
  dn         = "uni/infra/fexprof-${var.name}"
  class_name = "infraFexP"
  content = {
    name = var.name
  }
}

resource "aci_rest" "infraFexBndlGrp" {
  dn         = "${aci_rest.infraFexP.id}/fexbundle-${var.name}"
  class_name = "infraFexBndlGrp"
  content = {
    name = var.name
  }
}