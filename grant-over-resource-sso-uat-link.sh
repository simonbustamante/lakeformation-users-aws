#!/bin/bash

# Definir la lista de usuarios
PROFILE="350281604643_AWSAdministratorAccess"
users=(
    "sso-app01-hq-uat-powerbi-gateway-integration"
)

ACCOUNTID="350281604643"
MAINCATALOGID="302754896336"
# "hq-raw-uat-cstmr-link"
    # "hq-raw-uat-cstmr-pii-link"
    # "hq-raw-uat-engmt-link"
    # "hq-raw-uat-engmt-pii-link"
    # "hq-raw-uat-finan-link"
    # "hq-raw-uat-finan-pii-link"
    # "hq-raw-uat-humre-link"
    # "hq-raw-uat-humre-pii-link"
    # "hq-raw-uat-insec-link"
    # "hq-raw-uat-insec-pii-link"
    # "hq-raw-uat-intec-link"
    # "hq-raw-uat-intec-pii-link"
    # "hq-raw-uat-legal-link"
    # "hq-raw-uat-legal-pii-link"
    # "hq-raw-uat-ntwrk-link"
    # "hq-raw-uat-ntwrk-pii-link"
    # "hq-raw-uat-pdsvc-link"
    # "hq-raw-uat-pdsvc-pii-link"
    # "hq-raw-uat-pdusg-link"
    # "hq-raw-uat-pdusg-pii-link"
    # "hq-raw-uat-refer-link"
    # "hq-raw-uat-refer-pii-link"
    # "hq-raw-uat-regul-link"
    # "hq-raw-uat-regul-pii-link"
    # "hq-raw-uat-sales-link"
    # "hq-raw-uat-sales-pii-link"
    # "hq-raw-uat-scpro-link"
    # "hq-raw-uat-scpro-pii-link"
DBS=(
    "hq-anl-uat-cstmr-link"
    "hq-anl-uat-cstmr-pii-link"
    "hq-anl-uat-engmt-link"
    "hq-anl-uat-engmt-pii-link"
    "hq-anl-uat-finan-link"
    "hq-anl-uat-finan-pii-link"
    "hq-anl-uat-humre-link"
    "hq-anl-uat-humre-pii-link"
    "hq-anl-uat-insec-link"
    "hq-anl-uat-insec-pii-link"
    "hq-anl-uat-intec-link"
    "hq-anl-uat-intec-pii-link"
    "hq-anl-uat-legal-link"
    "hq-anl-uat-legal-pii-link"
    "hq-anl-uat-ntwrk-link"
    "hq-anl-uat-ntwrk-pii-link"
    "hq-anl-uat-pdsvc-link"
    "hq-anl-uat-pdsvc-pii-link"
    "hq-anl-uat-pdusg-link"
    "hq-anl-uat-pdusg-pii-link"
    "hq-anl-uat-refer-link"
    "hq-anl-uat-refer-pii-link"
    "hq-anl-uat-regul-link"
    "hq-anl-uat-regul-pii-link"
    "hq-anl-uat-sales-link"
    "hq-anl-uat-sales-pii-link"
    "hq-anl-uat-scpro-link"
    "hq-anl-uat-scpro-pii-link"
    "hq-std-uat-cstmr-link"
    "hq-std-uat-cstmr-pii-link"
    "hq-std-uat-engmt-link"
    "hq-std-uat-engmt-pii-link"
    "hq-std-uat-finan-link"
    "hq-std-uat-finan-pii-link"
    "hq-std-uat-humre-link"
    "hq-std-uat-humre-pii-link"
    "hq-std-uat-insec-link"
    "hq-std-uat-insec-pii-link"
    "hq-std-uat-intec-link"
    "hq-std-uat-intec-pii-link"
    "hq-std-uat-legal-link"
    "hq-std-uat-legal-pii-link"
    "hq-std-uat-ntwrk-link"
    "hq-std-uat-ntwrk-pii-link"
    "hq-std-uat-pdsvc-link"
    "hq-std-uat-pdsvc-pii-link"
    "hq-std-uat-pdusg-link"
    "hq-std-uat-pdusg-pii-link"
    "hq-std-uat-refer-link"
    "hq-std-uat-refer-pii-link"
    "hq-std-uat-regul-link"
    "hq-std-uat-regul-pii-link"
    "hq-std-uat-sales-link"
    "hq-std-uat-sales-pii-link"
    "hq-std-uat-scpro-link"
    "hq-std-uat-scpro-pii-link"
)



for DB in "${DBS[@]}"; do
    for user in "${users[@]}"; do
         # Otorgar permiso DESCRIBE en la base de datos
        aws lakeformation grant-permissions \
            --principal DataLakePrincipalIdentifier=arn:aws:iam::$ACCOUNTID:user/power-bi-users/$user \
            --permissions "DESCRIBE" \
            --resource '{"Database":{"Name": "'$DB'"}}' \
            --profile $PROFILE

        # Otorgar permiso SELECT y ALTER en todas las tablas de la base de datos
        # aws lakeformation grant-permissions \
        #     --principal DataLakePrincipalIdentifier=arn:aws:iam::$ACCOUNTID:user/power-bi-users/$user \
        #     --resource DataLakeResourceIdentifierType=CUSTOMER-PROVIDED \
        #     --permissions "SELECT" \
        #     --condition '{ "StringEquals": { 
        #             "aws:lakeformation:tag/Environment": "dev",
        #             "aws:lakeformation:tag/Domain": "engmt",
        #             "aws:lakeformation:tag/Schema": "anl",
        #             "aws:lakeformation:tag/Country": "pa" 
        #          } 
        #        }'\
        #     --profile $PROFILE

        # aws lakeformation grant-permissions \
        #     --principal DataLakePrincipalIdentifier=arn:aws:iam::$ACCOUNTID:user/power-bi-users/$user \
        #     --permissions "GrantWithLFTagExpression" \
        #     --resource '{ "LFTag": {"CatalogId":"'$MAINCATALOGID'","TagKey":"Environment","TagValues":["*"]}}'\
        #     --profile $PROFILE

        # aws lakeformation grant-permissions \
        #     --principal DataLakePrincipalIdentifier=arn:aws:iam::$ACCOUNTID:user/power-bi-users/$user \
        #     --permissions "ASSOCIATE" \
        #     --resource '{ "LFTag": {"CatalogId":"'$MAINCATALOGID'","TagKey":"Domain","TagValues":["*"]}}'\
        #     --profile $PROFILE

        # aws lakeformation grant-permissions \
        #     --principal DataLakePrincipalIdentifier=arn:aws:iam::$ACCOUNTID:user/power-bi-users/$user \
        #     --permissions "ASSOCIATE" \
        #     --resource '{ "LFTag": {"CatalogId":"'$MAINCATALOGID'","TagKey":"Schema","TagValues":["*"]}}'\
        #     --profile $PROFILE

        # aws lakeformation grant-permissions \
        #     --principal DataLakePrincipalIdentifier=arn:aws:iam::$ACCOUNTID:user/power-bi-users/$user \
        #     --permissions "ASSOCIATE" \
        #     --resource '{ "LFTag": {"CatalogId":"'$MAINCATALOGID'","TagKey":"Country","TagValues":["*"]}}'\
        #     --profile $PROFILE

        # aws lakeformation grant-permissions \
        # --principal DataLakePrincipalIdentifier=arn:aws:iam::579325186151:user/power-bi-simon-bustamante-hq-athena-access-prd \
        # --permissions "DESCRIBE" \
        # --resource '{ "LFTag": { "CatalogId": "'$MAINCATALOGID'", "TagKey": "Environment", "TagValues": ["*"] }}' \
        # --profile "579325186151_AWSAdministratorAccess"


        echo "Granted DEV DESCRIBE  permissions on '$DB' for '$user'"
    done
done

