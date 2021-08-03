output "dn" {
  value       = aci_rest.infraFexP.id
  description = "Distinguished name of `infraFexP` object."
}

output "name" {
  value       = aci_rest.infraFexP.content.name
  description = "FEX interface profile name."
}
