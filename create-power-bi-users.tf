#### PANAMA DEV LAKE ##############
###################################
###################################
###################################
###################################

provider "aws" {
  alias = "dev"
  profile = "579325186151_AWSAdministratorAccess"
  region  = "us-east-1"
}


variable "users" {
  description = "List of user name"
  default = [
    "power-bi-lourdes-laguna-pa-athena-access-dev",
    "power-bi-simon-bustamante-pa-athena-access-dev",
    "power-bi-andy-guardia-pa-athena-access-dev",
    "power-bi-carlos-ovalle-pa-athena-access-dev",
    "power-bi-gtw-pa-athena-access-dev",
    #"simon-test",
    # ... Añadir más usuarios  según sea necesario
  ]
}

resource "aws_iam_policy" "athena_policy" {
  provider = aws.dev
  name        = "plc-athena-access-policy-power-bi-app-001"
  description = "Policy for allowing access to Athena"
  policy      = jsonencode(
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "Statement1",
                "Effect": "Allow",
                "Action": [
                    "athena:*"
                ],
                "Resource": [
                    "*"
                ]
            },
            {
                "Sid": "S3FullAccessStatement",
                "Effect": "Allow",
                "Action": "s3:*",
                "Resource": "*"
            },
            {
                "Sid": "GlueStatement",
                "Effect": "Allow",
                "Action": [
                    "glue:GetDatabases",
                    "glue:GetTables",
                    "glue:GetTable",
                    "glue:GetPartitions"
                ],
                "Resource": "*"
            },
            {
                "Sid": "LakeFormationStatement",
                "Effect": "Allow",
                "Action": [
                    "lakeformation:DescribeTable",
                    "lakeformation:GetDataAccess"
                ],
                "Resource": "*"
            }
        ]
    }
  )
}

resource "aws_iam_user" "app_user" {
  provider = aws.dev
  count = length(var.users)
  name  = var.users[count.index] # Tomar el nombre del usuario del array
  path  = "/power-bi-users/"
}


resource "aws_iam_user_policy_attachment" "athena_policy_attachment" {
  provider = aws.dev
  count      = length(var.users)
  user       = aws_iam_user.app_user[count.index].name
  policy_arn = aws_iam_policy.athena_policy.arn
}

resource "aws_iam_access_key" "user_key" {
  provider = aws.dev
  count = length(var.users)
  user = aws_iam_user.app_user[count.index].name
}

resource "local_file" "user_keys_csv" {
  count = length(var.users)
  content  = "AccessKey,SecretKey\n${aws_iam_access_key.user_key[count.index].id},${aws_iam_access_key.user_key[count.index].secret}"
  filename = "${var.users[count.index]}.csv"
}

#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### PANAMA UAT LAKE #######
#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### #### #### #### #### #### 

provider "aws" {
  alias = "uat"
  profile = "655235974679_AWSAdministratorAccess"
  region  = "us-east-1"
}


variable "users_uat" {
  description = "List of user name"
  default = [
    "power-bi-lourdes-laguna-pa-athena-access-uat",
    "power-bi-simon-bustamante-pa-athena-access-uat",
    "power-bi-andy-guardia-pa-athena-access-uat",
    "power-bi-carlos-ovalle-pa-athena-access-uat",
    "power-bi-gtw-pa-athena-access-uat",
    #"simon-test",
    # ... Añadir más usuarios  según sea necesario
  ]
}

resource "aws_iam_policy" "athena_policy_uat" {
  provider = aws.uat
  name        = "plc-athena-access-policy-power-bi-uat-app-001"
  description = "Policy for allowing access to Athena"
  policy      = jsonencode(
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "Statement1",
                "Effect": "Allow",
                "Action": [
                    "athena:*"
                ],
                "Resource": [
                    "*"
                ]
            },
            {
                "Sid": "S3FullAccessStatement",
                "Effect": "Allow",
                "Action": "s3:*",
                "Resource": "*"
            },
            {
                "Sid": "GlueStatement",
                "Effect": "Allow",
                "Action": [
                    "glue:GetDatabases",
                    "glue:GetTables",
                    "glue:GetTable",
                    "glue:GetPartitions"
                ],
                "Resource": "*"
            },
            {
                "Sid": "LakeFormationStatement",
                "Effect": "Allow",
                "Action": [
                    "lakeformation:DescribeTable",
                    "lakeformation:GetDataAccess"
                ],
                "Resource": "*"
            }
        ]
    }
  )
}

resource "aws_iam_user" "app_user_uat" {
  provider = aws.uat
  count = length(var.users_uat)
  name  = var.users_uat[count.index] # Tomar el nombre del usuario del array
  path  = "/power-bi-users/"
}


resource "aws_iam_user_policy_attachment" "athena_policy_attachment_uat" {
  provider = aws.uat
  count      = length(var.users_uat)
  user       = aws_iam_user.app_user_uat[count.index].name
  policy_arn = aws_iam_policy.athena_policy_uat.arn
}

resource "aws_iam_access_key" "user_key_uat" {
  provider = aws.uat
  count = length(var.users_uat)
  user = aws_iam_user.app_user_uat[count.index].name
}

resource "local_file" "user_keys_csv_uat" {
  count = length(var.users_uat)
  content  = "AccessKey,SecretKey\n${aws_iam_access_key.user_key_uat[count.index].id},${aws_iam_access_key.user_key_uat[count.index].secret}"
  filename = "${var.users_uat[count.index]}.csv"
}



#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### PANAMA PRD LAKE #######
#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### #### #### #### #### #### 

provider "aws" {
  alias = "prd"
  profile = "981625247045_AWSAdministratorAccess"
  region  = "us-east-1"
}


variable "users_prd" {
  description = "List of user name"
  default = [
    "power-bi-lourdes-laguna-pa-athena-access-prd",
    "power-bi-simon-bustamante-pa-athena-access-prd",
    "power-bi-andy-guardia-pa-athena-access-prd",
    "power-bi-carlos-ovalle-pa-athena-access-prd",
    "power-bi-gtw-pa-athena-access-prd",
    #"simon-test",
    # ... Añadir más usuarios  según sea necesario
  ]
}

resource "aws_iam_policy" "athena_policy_prd" {
  provider = aws.prd
  name        = "plc-athena-access-policy-power-bi-prd-app-001"
  description = "Policy for allowing access to Athena"
  policy      = jsonencode(
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "Statement1",
                "Effect": "Allow",
                "Action": [
                    "athena:*"
                ],
                "Resource": [
                    "*"
                ]
            },
            {
                "Sid": "S3FullAccessStatement",
                "Effect": "Allow",
                "Action": "s3:*",
                "Resource": "*"
            },
            {
                "Sid": "GlueStatement",
                "Effect": "Allow",
                "Action": [
                    "glue:GetDatabases",
                    "glue:GetTables",
                    "glue:GetTable",
                    "glue:GetPartitions"
                ],
                "Resource": "*"
            },
            {
                "Sid": "LakeFormationStatement",
                "Effect": "Allow",
                "Action": [
                    "lakeformation:DescribeTable",
                    "lakeformation:GetDataAccess"
                ],
                "Resource": "*"
            }
        ]
    }
  )
}

resource "aws_iam_user" "app_user_prd" {
  provider = aws.prd
  count = length(var.users_prd)
  name  = var.users_prd[count.index] # Tomar el nombre del usuario del array
  path  = "/power-bi-users/"
}


resource "aws_iam_user_policy_attachment" "athena_policy_attachment_prd" {
  provider = aws.prd
  count      = length(var.users_prd)
  user       = aws_iam_user.app_user_prd[count.index].name
  policy_arn = aws_iam_policy.athena_policy_prd.arn
}

resource "aws_iam_access_key" "user_key_prd" {
  provider = aws.prd
  count = length(var.users_prd)
  user = aws_iam_user.app_user_prd[count.index].name
}

resource "local_file" "user_keys_csv_prd" {
  count = length(var.users_prd)
  content  = "AccessKey,SecretKey\n${aws_iam_access_key.user_key_prd[count.index].id},${aws_iam_access_key.user_key_prd[count.index].secret}"
  filename = "${var.users_prd[count.index]}.csv"
}


#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### HQ DEVOPS ANALYTICS #######
#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### #### #### #### #### #### 

provider "aws" {
  alias = "devops"
  profile = "092513563293_AWSAdministratorAccess"
  region  = "us-east-1"
}


variable "users_devops" {
  description = "List of user name"
  default = [
    "power-bi-mauricio-iturri-hq-athena-access-devops",
    "power-bi-gtw-user-hq-athena-access-devops",
    "power-bi-margaret-caseres-hq-athena-access-devops",
    #"simon-test",
    # ... Añadir más usuarios  según sea necesario
  ]
}

resource "aws_iam_policy" "athena_policy_devops" {
  provider = aws.devops
  name        = "plc-athena-access-policy-power-bi-devops-app-001"
  description = "Policy for allowing access to Athena"
  policy      = jsonencode(
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "Statement1",
                "Effect": "Allow",
                "Action": [
                    "athena:*"
                ],
                "Resource": [
                    "*"
                ]
            },
            {
                "Sid": "S3FullAccessStatement",
                "Effect": "Allow",
                "Action": "s3:*",
                "Resource": "*"
            },
            {
                "Sid": "GlueStatement",
                "Effect": "Allow",
                "Action": [
                    "glue:GetDatabases",
                    "glue:GetTables",
                    "glue:GetTable",
                    "glue:GetPartitions"
                ],
                "Resource": "*"
            },
            {
                "Sid": "LakeFormationStatement",
                "Effect": "Allow",
                "Action": [
                    "lakeformation:DescribeTable",
                    "lakeformation:GetDataAccess"
                ],
                "Resource": "*"
            }
        ]
    }
  )
}

resource "aws_iam_user" "app_user_devops" {
  provider = aws.devops
  count = length(var.users_devops)
  name  = var.users_devops[count.index] # Tomar el nombre del usuario del array
  path  = "/power-bi-users/"
}


resource "aws_iam_user_policy_attachment" "athena_policy_attachment_devops" {
  provider = aws.devops
  count      = length(var.users_devops)
  user       = aws_iam_user.app_user_devops[count.index].name
  policy_arn = aws_iam_policy.athena_policy_devops.arn
}

resource "aws_iam_access_key" "user_key_devops" {
  provider = aws.devops
  count = length(var.users_devops)
  user = aws_iam_user.app_user_devops[count.index].name
}

resource "local_file" "user_keys_csv_devops" {
  count = length(var.users_devops)
  content  = "AccessKey,SecretKey\n${aws_iam_access_key.user_key_devops[count.index].id},${aws_iam_access_key.user_key_devops[count.index].secret}"
  filename = "${var.users_devops[count.index]}.csv"
}


#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### HQ PRD LAKEHOUSE #######
#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### #### #### #### #### #### 

provider "aws" {
  alias = "hqprd"
  profile = "525196274797_AWSAdministratorAccess"
  region  = "us-east-1"
}


variable "users_hqprd" {
  description = "List of user name"
  default = [
    "sso-app01-hq-prd-powerbi-gateway-integration",
    "sso-app01-py-prd-cstmr-salesforce-l2o-integration"
    #"simon-test",
    # ... Añadir más usuarios  según sea necesario
  ]
}

resource "aws_iam_policy" "athena_policy_hqprd" {
  provider = aws.hqprd
  name        = "plc-athena-access-policy-power-bi-hqprd-app-001"
  description = "Policy for allowing access to Athena"
  policy      = jsonencode(
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "Statement1",
                "Effect": "Allow",
                "Action": [
                    "athena:*"
                ],
                "Resource": [
                    "*"
                ]
            },
            {
                "Sid": "S3FullAccessStatement",
                "Effect": "Allow",
                "Action": "s3:*",
                "Resource": "*"
            },
            {
                "Sid": "GlueStatement",
                "Effect": "Allow",
                "Action": [
                    "glue:GetDatabases",
                    "glue:GetTables",
                    "glue:GetTable",
                    "glue:GetPartitions"
                ],
                "Resource": "*"
            },
            {
                "Sid": "LakeFormationStatement",
                "Effect": "Allow",
                "Action": [
                    "lakeformation:DescribeTable",
                    "lakeformation:GetDataAccess"
                ],
                "Resource": "*"
            }
        ]
    }
  )
}

resource "aws_iam_user" "app_user_hqprd" {
  provider = aws.hqprd
  count = length(var.users_hqprd)
  name  = var.users_hqprd[count.index] # Tomar el nombre del usuario del array
  path  = "/power-bi-users/"
}


resource "aws_iam_user_policy_attachment" "athena_policy_attachment_hqprd" {
  provider = aws.hqprd
  count      = length(var.users_hqprd)
  user       = aws_iam_user.app_user_hqprd[count.index].name
  policy_arn = aws_iam_policy.athena_policy_hqprd.arn
}

resource "aws_iam_access_key" "user_key_hqprd" {
  provider = aws.hqprd
  count = length(var.users_hqprd)
  user = aws_iam_user.app_user_hqprd[count.index].name
}

resource "local_file" "user_keys_csv_hqprd" {
  count = length(var.users_hqprd)
  content  = "AccessKey,SecretKey\n${aws_iam_access_key.user_key_hqprd[count.index].id},${aws_iam_access_key.user_key_hqprd[count.index].secret}"
  filename = "${var.users_hqprd[count.index]}.csv"
}


#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### HQ UAT LAKEHOUSE #######
#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### #### #### #### #### #### 

provider "aws" {
  alias = "hquat"
  profile = "350281604643_AWSAdministratorAccess"
  region  = "us-east-1"
}


variable "users_hquat" {
  description = "List of user name"
  default = [
    "sso-app01-hq-uat-powerbi-gateway-integration"
    #"simon-test",
    # ... Añadir más usuarios  según sea necesario
  ]
}

resource "aws_iam_policy" "athena_policy_hquat" {
  provider = aws.hquat
  name        = "plc-athena-access-policy-power-bi-hquat-app-001"
  description = "Policy for allowing access to Athena"
  policy      = jsonencode(
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "Statement1",
                "Effect": "Allow",
                "Action": [
                    "athena:*"
                ],
                "Resource": [
                    "*"
                ]
            },
            {
                "Sid": "S3FullAccessStatement",
                "Effect": "Allow",
                "Action": "s3:*",
                "Resource": "*"
            },
            {
                "Sid": "GlueStatement",
                "Effect": "Allow",
                "Action": [
                    "glue:GetDatabases",
                    "glue:GetTables",
                    "glue:GetTable",
                    "glue:GetPartitions"
                ],
                "Resource": "*"
            },
            {
                "Sid": "LakeFormationStatement",
                "Effect": "Allow",
                "Action": [
                    "lakeformation:DescribeTable",
                    "lakeformation:GetDataAccess"
                ],
                "Resource": "*"
            }
        ]
    }
  )
}

resource "aws_iam_user" "app_user_hquat" {
  provider = aws.hquat
  count = length(var.users_hquat)
  name  = var.users_hquat[count.index] # Tomar el nombre del usuario del array
  path  = "/power-bi-users/"
}


resource "aws_iam_user_policy_attachment" "athena_policy_attachment_hquat" {
  provider = aws.hquat
  count      = length(var.users_hquat)
  user       = aws_iam_user.app_user_hquat[count.index].name
  policy_arn = aws_iam_policy.athena_policy_hquat.arn
}

resource "aws_iam_access_key" "user_key_hquat" {
  provider = aws.hquat
  count = length(var.users_hquat)
  user = aws_iam_user.app_user_hquat[count.index].name
}

resource "local_file" "user_keys_csv_hquat" {
  count = length(var.users_hquat)
  content  = "AccessKey,SecretKey\n${aws_iam_access_key.user_key_hquat[count.index].id},${aws_iam_access_key.user_key_hquat[count.index].secret}"
  filename = "${var.users_hquat[count.index]}.csv"
}



#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### PY DEVOPS ANALYTICS #######
#### #### #### #### #### #### 
#### #### #### #### #### #### 
#### #### #### #### #### #### 


provider "aws" {
  alias = "pydevopsanl"
  profile = "323299143606_AWSAdministratorAccess"
  region  = "us-east-1"
}


variable "users_pydevopsanl" {
  description = "List of user name"
  default = [
    "power-bi-gtw-user-py-athena-access-devops-anl",
    #"simon-test",
    # ... Añadir más usuarios  según sea necesario
  ]
}

resource "aws_iam_policy" "athena_policy_pydevopsanl" {
  provider = aws.pydevopsanl
  name        = "plc-athena-access-policy-power-bi-py-devops-anl-app-001"
  description = "Policy for allowing access to Athena"
  policy      = jsonencode(
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "Statement1",
                "Effect": "Allow",
                "Action": [
                    "athena:*"
                ],
                "Resource": [
                    "*"
                ]
            },
            {
                "Sid": "S3FullAccessStatement",
                "Effect": "Allow",
                "Action": "s3:*",
                "Resource": "*"
            },
            {
                "Sid": "GlueStatement",
                "Effect": "Allow",
                "Action": [
                    "glue:GetDatabases",
                    "glue:GetTables",
                    "glue:GetTable",
                    "glue:GetPartitions"
                ],
                "Resource": "*"
            },
            {
                "Sid": "LakeFormationStatement",
                "Effect": "Allow",
                "Action": [
                    "lakeformation:DescribeTable",
                    "lakeformation:GetDataAccess"
                ],
                "Resource": "*"
            }
        ]
    }
  )
}

resource "aws_iam_user" "app_user_pydevopsanl" {
  provider = aws.pydevopsanl
  count = length(var.users_pydevopsanl)
  name  = var.users_pydevopsanl[count.index] # Tomar el nombre del usuario del array
  path  = "/power-bi-users/"
}


resource "aws_iam_user_policy_attachment" "athena_policy_attachment_pydevopsanl" {
  provider = aws.pydevopsanl
  count      = length(var.users_pydevopsanl)
  user       = aws_iam_user.app_user_pydevopsanl[count.index].name
  policy_arn = aws_iam_policy.athena_policy_pydevopsanl.arn
}

resource "aws_iam_access_key" "user_key_pydevopsanl" {
  provider = aws.pydevopsanl
  count = length(var.users_pydevopsanl)
  user = aws_iam_user.app_user_pydevopsanl[count.index].name
}

resource "local_file" "user_keys_csv_pydevopsanl" {
  count = length(var.users_pydevopsanl)
  content  = "AccessKey,SecretKey\n${aws_iam_access_key.user_key_pydevopsanl[count.index].id},${aws_iam_access_key.user_key_pydevopsanl[count.index].secret}"
  filename = "${var.users_pydevopsanl[count.index]}.csv"
}
