variable "nombre" {
  type    = string
  default = "Carlos"
}

variable "num" {
  type    = number
  default = 100
}

variable "persona" {
  type = map(any)
  default = {
    filename = "persona.txt"
    content  = "Kevin Blanco Murillo"
  }
}

variable "genero" {
  type    = list(string)
  default = ["Masculino", "Femenino", "Otros..."]
}

variable "discos" {
  type = map(any)
	description = "tipos de almacenamiento"
}

variable "identificacion" {
  type    = number
}