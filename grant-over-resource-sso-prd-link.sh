#!/bin/bash

# Definir la lista de usuarios
PROFILE="525196274797_AWSAdministratorAccess"
users=(
    "sso-app01-hq-prd-powerbi-gateway-integration"
    "sso-app01-py-prd-cstmr-salesforce-l2o-integration"
)

ACCOUNTID="525196274797"
MAINCATALOGID="302754896336"

DBS=(
    "hq-anl-prd-cstmr-link"
    "hq-anl-prd-cstmr-pii-link"
    "hq-anl-prd-engmt-link"
    "hq-anl-prd-engmt-pii-link"
    "hq-anl-prd-finan-link"
    "hq-anl-prd-finan-pii-link"
    "hq-anl-prd-humre-link"
    "hq-anl-prd-humre-pii-link"
    "hq-anl-prd-insec-link"
    "hq-anl-prd-insec-pii-link"
    "hq-anl-prd-intec-link"
    "hq-anl-prd-intec-pii-link"
    "hq-anl-prd-legal-link"
    "hq-anl-prd-legal-pii-link"
    "hq-anl-prd-ntwrk-link"
    "hq-anl-prd-ntwrk-pii-link"
    "hq-anl-prd-pdsvc-link"
    "hq-anl-prd-pdsvc-pii-link"
    "hq-anl-prd-pdusg-link"
    "hq-anl-prd-pdusg-pii-link"
    "hq-anl-prd-refer-link"
    "hq-anl-prd-refer-pii-link"
    "hq-anl-prd-regul-link"
    "hq-anl-prd-regul-pii-link"
    "hq-anl-prd-sales-link"
    "hq-anl-prd-sales-pii-link"
    "hq-anl-prd-scpro-link"
    "hq-anl-prd-scpro-pii-link"
    "hq-std-prd-cstmr-link"
    "hq-std-prd-cstmr-pii-link"
    "hq-std-prd-engmt-link"
    "hq-std-prd-engmt-pii-link"
    "hq-std-prd-finan-link"
    "hq-std-prd-finan-pii-link"
    "hq-std-prd-humre-link"
    "hq-std-prd-humre-pii-link"
    "hq-std-prd-insec-link"
    "hq-std-prd-insec-pii-link"
    "hq-std-prd-intec-link"
    "hq-std-prd-intec-pii-link"
    "hq-std-prd-legal-link"
    "hq-std-prd-legal-pii-link"
    "hq-std-prd-ntwrk-link"
    "hq-std-prd-ntwrk-pii-link"
    "hq-std-prd-pdsvc-link"
    "hq-std-prd-pdsvc-pii-link"
    "hq-std-prd-pdusg-link"
    "hq-std-prd-pdusg-pii-link"
    "hq-std-prd-refer-link"
    "hq-std-prd-refer-pii-link"
    "hq-std-prd-regul-link"
    "hq-std-prd-regul-pii-link"
    "hq-std-prd-sales-link"
    "hq-std-prd-sales-pii-link"
    "hq-std-prd-scpro-link"
    "hq-std-prd-scpro-pii-link"
    "hq-raw-prd-cstmr-link"
    "hq-raw-prd-cstmr-pii-link"
    "hq-raw-prd-engmt-link"
    "hq-raw-prd-engmt-pii-link"
    "hq-raw-prd-finan-link"
    "hq-raw-prd-finan-pii-link"
    "hq-raw-prd-humre-link"
    "hq-raw-prd-humre-pii-link"
    "hq-raw-prd-insec-link"
    "hq-raw-prd-insec-pii-link"
    "hq-raw-prd-intec-link"
    "hq-raw-prd-intec-pii-link"
    "hq-raw-prd-legal-link"
    "hq-raw-prd-legal-pii-link"
    "hq-raw-prd-ntwrk-link"
    "hq-raw-prd-ntwrk-pii-link"
    "hq-raw-prd-pdsvc-link"
    "hq-raw-prd-pdsvc-pii-link"
    "hq-raw-prd-pdusg-link"
    "hq-raw-prd-pdusg-pii-link"
    "hq-raw-prd-refer-link"
    "hq-raw-prd-refer-pii-link"
    "hq-raw-prd-regul-link"
    "hq-raw-prd-regul-pii-link"
    "hq-raw-prd-sales-link"
    "hq-raw-prd-sales-pii-link"
    "hq-raw-prd-scpro-link"
    "hq-raw-prd-scpro-pii-link"
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

