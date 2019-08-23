variable "server_id" {
  description = "The server ID of the Transfer Server (e.g. `s-12345678`)"
}

variable "admin" {
  description = "A mapping describing the admin user."
  default = {
    user_name = "aisamji"
    ssh_keys  = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDAhoO7EJQVi/iJG7dxblXPmYNhcilY+E53XnPcNjhRYYMmFCPdkpBzpdXfoWjFeYaO/6W6bi7H1jTjmv9goZfYIeoSaMZ2AJ7XtienPRFNUKMPt1VrUnxwhENMBWqqBSl2/iv5OyxJ8RJPn2QqchXJFoVobOz94a01gTSlasAY9n1ee63k1miWUTfovgdAg0LTPRJR1r03J4aHiZRGEGNi3F1MDx1pIrocEBt3VUinIydHTDZnhPbJOQ1S2mPuBO9p83PT2H2Ev+SVdybvTCObGVq6dFV/T56nLJd7WlxrvlxhBgeq+pGIQ8Qisu35EJ9mc8DVg2PjWCsKbMYO5AP+AyHyaJqKGNkgbxw10azk8xwpJdx+676jyZJrXHNs6SpgTUXZJyHroH9LVUB+i0xWJL+WiS7Vblu2Wue3QE0ikByJPo367CM9/719OsxF6YE5uW2+q0Ap/0807/95u/Kf0owNjurIUK5tb5NsHNGIgSYHAiJmic+vTyhdvOOHKWbpJlXjr2GjCSllnecJJy7/ZWtKb1DvnjERhqy/qTDPcobOUWduh9QpMz6IDsiBplXD3L5p/XHouxSRbYUeZzqhGGJaGs7CwfVlREaZbbqpRXRFP6RJQ7fUEJ8qQu2zLXhZPpJqxOuL7bri+Rjw5Lac07zW+iHuny4Zx0etOQSe5w== aisamji09@gmail.com"]
  }
}

variable "admin_home_dir" {
  description = "The *root* prefix that the admin will have access to."
  default     = "data"
}

variable "logger" {
  description = "A mapping describing the logging user."
  default = {
    user_name = "danny"
    ssh_keys  = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDAhoO7EJQVi/iJG7dxblXPmYNhcilY+E53XnPcNjhRYYMmFCPdkpBzpdXfoWjFeYaO/6W6bi7H1jTjmv9goZfYIeoSaMZ2AJ7XtienPRFNUKMPt1VrUnxwhENMBWqqBSl2/iv5OyxJ8RJPn2QqchXJFoVobOz94a01gTSlasAY9n1ee63k1miWUTfovgdAg0LTPRJR1r03J4aHiZRGEGNi3F1MDx1pIrocEBt3VUinIydHTDZnhPbJOQ1S2mPuBO9p83PT2H2Ev+SVdybvTCObGVq6dFV/T56nLJd7WlxrvlxhBgeq+pGIQ8Qisu35EJ9mc8DVg2PjWCsKbMYO5AP+AyHyaJqKGNkgbxw10azk8xwpJdx+676jyZJrXHNs6SpgTUXZJyHroH9LVUB+i0xWJL+WiS7Vblu2Wue3QE0ikByJPo367CM9/719OsxF6YE5uW2+q0Ap/0807/95u/Kf0owNjurIUK5tb5NsHNGIgSYHAiJmic+vTyhdvOOHKWbpJlXjr2GjCSllnecJJy7/ZWtKb1DvnjERhqy/qTDPcobOUWduh9QpMz6IDsiBplXD3L5p/XHouxSRbYUeZzqhGGJaGs7CwfVlREaZbbqpRXRFP6RJQ7fUEJ8qQu2zLXhZPpJqxOuL7bri+Rjw5Lac07zW+iHuny4Zx0etOQSe5w== aisamji09@gmail.com"]
  }
}

variable "logger_home_dir" {
  description = "The *root* prefix that the logger will have access to."
  default     = "data/logs"
}

variable "bucket_name" {
  description = "The name of the S3 bucket that these users should have access to."
}
