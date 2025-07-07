# Primero se crea la instancia en EC2
# tf import aws_instance.my_instance_import i-023cb0a6116edc076
# tf state list -> para busar el state de este recurso
# tf state show aws_instance.my_instance_import -> para ver el state de este recurso
# Luego se completa con el codigo de la instancia

resource "aws_instance" "my_instance_import" {
    ami                                  = "ami-061ad72bc140532fd"
    instance_type                        = "t3.micro"
    key_name = data.aws_key_pair.myKey.key_name
    subnet_id                            = aws_subnet.public_subnet.id
}