#!/bin/bash

# Definir la lista de usuarios
PROFILE="323299143606_AWSAdministratorAccess"

users=(
    "power-bi-gtw-user-py-athena-access-devops-anl"
)

ACCOUNTID="323299143606"
MAINCATALOGID="302754896336"

DBS=(
    "py-anl-dev-cstmr-link"
    "py-anl-dev-cstmr-pii-link"
    "py-anl-dev-engmt-link"
    "py-anl-dev-engmt-pii-link"
    "py-anl-dev-finan-link"
    "py-anl-dev-finan-pii-link"
    "py-anl-dev-humre-link"
    "py-anl-dev-humre-pii-link"
    "py-anl-dev-insec-link"
    "py-anl-dev-insec-pii-link"
    "py-anl-dev-intec-link"
    "py-anl-dev-intec-pii-link"
    "py-anl-dev-legal-link"
    "py-anl-dev-legal-pii-link"
    "py-anl-dev-ntwrk-link"
    "py-anl-dev-ntwrk-pii-link"
    "py-anl-dev-pdsvc-link"
    "py-anl-dev-pdsvc-pii-link"
    "py-anl-dev-pdusg-link"
    "py-anl-dev-pdusg-pii-link"
    "py-anl-dev-refer-link"
    "py-anl-dev-refer-pii-link"
    "py-anl-dev-regul-link"
    "py-anl-dev-regul-pii-link"
    "py-anl-dev-sales-link"
    "py-anl-dev-sales-pii-link"
    "py-anl-dev-scpro-link"
    "py-anl-dev-scpro-pii-link"
    "py-raw-dev-cstmr-link"
    "py-raw-dev-cstmr-pii-link"
    "py-raw-dev-engmt-link"
    "py-raw-dev-engmt-pii-link"
    "py-raw-dev-finan-link"
    "py-raw-dev-finan-pii-link"
    "py-raw-dev-humre-link"
    "py-raw-dev-humre-pii-link"
    "py-raw-dev-insec-link"
    "py-raw-dev-insec-pii-link"
    "py-raw-dev-intec-link"
    "py-raw-dev-intec-pii-link"
    "py-raw-dev-legal-link"
    "py-raw-dev-legal-pii-link"
    "py-raw-dev-ntwrk-link"
    "py-raw-dev-ntwrk-pii-link"
    "py-raw-dev-pdsvc-link"
    "py-raw-dev-pdsvc-pii-link"
    "py-raw-dev-pdusg-link"
    "py-raw-dev-pdusg-pii-link"
    "py-raw-dev-refer-link"
    "py-raw-dev-refer-pii-link"
    "py-raw-dev-regul-link"
    "py-raw-dev-regul-pii-link"
    "py-raw-dev-sales-link"
    "py-raw-dev-sales-pii-link"
    "py-raw-dev-scpro-link"
    "py-raw-dev-scpro-pii-link"
    "py-std-dev-cstmr-link"
    "py-std-dev-cstmr-pii-link"
    "py-std-dev-engmt-link"
    "py-std-dev-engmt-pii-link"
    "py-std-dev-finan-link"
    "py-std-dev-finan-pii-link"
    "py-std-dev-humre-link"
    "py-std-dev-humre-pii-link"
    "py-std-dev-insec-link"
    "py-std-dev-insec-pii-link"
    "py-std-dev-intec-link"
    "py-std-dev-intec-pii-link"
    "py-std-dev-legal-link"
    "py-std-dev-legal-pii-link"
    "py-std-dev-ntwrk-link"
    "py-std-dev-ntwrk-pii-link"
    "py-std-dev-pdsvc-link"
    "py-std-dev-pdsvc-pii-link"
    "py-std-dev-pdusg-link"
    "py-std-dev-pdusg-pii-link"
    "py-std-dev-refer-link"
    "py-std-dev-refer-pii-link"
    "py-std-dev-regul-link"
    "py-std-dev-regul-pii-link"
    "py-std-dev-sales-link"
    "py-std-dev-sales-pii-link"
    "py-std-dev-scpro-link"
    "py-std-dev-scpro-pii-link"
    "py-anl-uat-cstmr-link"
    "py-anl-uat-cstmr-pii-link"
    "py-anl-uat-engmt-link"
    "py-anl-uat-engmt-pii-link"
    "py-anl-uat-finan-link"
    "py-anl-uat-finan-pii-link"
    "py-anl-uat-humre-link"
    "py-anl-uat-humre-pii-link"
    "py-anl-uat-insec-link"
    "py-anl-uat-insec-pii-link"
    "py-anl-uat-intec-link"
    "py-anl-uat-intec-pii-link"
    "py-anl-uat-legal-link"
    "py-anl-uat-legal-pii-link"
    "py-anl-uat-ntwrk-link"
    "py-anl-uat-ntwrk-pii-link"
    "py-anl-uat-pdsvc-link"
    "py-anl-uat-pdsvc-pii-link"
    "py-anl-uat-pdusg-link"
    "py-anl-uat-pdusg-pii-link"
    "py-anl-uat-refer-link"
    "py-anl-uat-refer-pii-link"
    "py-anl-uat-regul-link"
    "py-anl-uat-regul-pii-link"
    "py-anl-uat-sales-link"
    "py-anl-uat-sales-pii-link"
    "py-anl-uat-scpro-link"
    "py-anl-uat-scpro-pii-link"
    "py-raw-uat-cstmr-link"
    "py-raw-uat-cstmr-pii-link"
    "py-raw-uat-engmt-link"
    "py-raw-uat-engmt-pii-link"
    "py-raw-uat-finan-link"
    "py-raw-uat-finan-pii-link"
    "py-raw-uat-humre-link"
    "py-raw-uat-humre-pii-link"
    "py-raw-uat-insec-link"
    "py-raw-uat-insec-pii-link"
    "py-raw-uat-intec-link"
    "py-raw-uat-intec-pii-link"
    "py-raw-uat-legal-link"
    "py-raw-uat-legal-pii-link"
    "py-raw-uat-ntwrk-link"
    "py-raw-uat-ntwrk-pii-link"
    "py-raw-uat-pdsvc-link"
    "py-raw-uat-pdsvc-pii-link"
    "py-raw-uat-pdusg-link"
    "py-raw-uat-pdusg-pii-link"
    "py-raw-uat-refer-link"
    "py-raw-uat-refer-pii-link"
    "py-raw-uat-regul-link"
    "py-raw-uat-regul-pii-link"
    "py-raw-uat-sales-link"
    "py-raw-uat-sales-pii-link"
    "py-raw-uat-scpro-link"
    "py-raw-uat-scpro-pii-link"
    "py-std-uat-cstmr-link"
    "py-std-uat-cstmr-pii-link"
    "py-std-uat-engmt-link"
    "py-std-uat-engmt-pii-link"
    "py-std-uat-finan-link"
    "py-std-uat-finan-pii-link"
    "py-std-uat-humre-link"
    "py-std-uat-humre-pii-link"
    "py-std-uat-insec-link"
    "py-std-uat-insec-pii-link"
    "py-std-uat-intec-link"
    "py-std-uat-intec-pii-link"
    "py-std-uat-legal-link"
    "py-std-uat-legal-pii-link"
    "py-std-uat-ntwrk-link"
    "py-std-uat-ntwrk-pii-link"
    "py-std-uat-pdsvc-link"
    "py-std-uat-pdsvc-pii-link"
    "py-std-uat-pdusg-link"
    "py-std-uat-pdusg-pii-link"
    "py-std-uat-refer-link"
    "py-std-uat-refer-pii-link"
    "py-std-uat-regul-link"
    "py-std-uat-regul-pii-link"
    "py-std-uat-sales-link"
    "py-std-uat-sales-pii-link"
    "py-std-uat-scpro-link"
    "py-std-uat-scpro-pii-link"
    "py-anl-prd-cstmr-link"
    "py-anl-prd-cstmr-pii-link"
    "py-anl-prd-engmt-link"
    "py-anl-prd-engmt-pii-link"
    "py-anl-prd-finan-link"
    "py-anl-prd-finan-pii-link"
    "py-anl-prd-humre-link"
    "py-anl-prd-humre-pii-link"
    "py-anl-prd-insec-link"
    "py-anl-prd-insec-pii-link"
    "py-anl-prd-intec-link"
    "py-anl-prd-intec-pii-link"
    "py-anl-prd-legal-link"
    "py-anl-prd-legal-pii-link"
    "py-anl-prd-ntwrk-link"
    "py-anl-prd-ntwrk-pii-link"
    "py-anl-prd-pdsvc-link"
    "py-anl-prd-pdsvc-pii-link"
    "py-anl-prd-pdusg-link"
    "py-anl-prd-pdusg-pii-link"
    "py-anl-prd-refer-link"
    "py-anl-prd-refer-pii-link"
    "py-anl-prd-regul-link"
    "py-anl-prd-regul-pii-link"
    "py-anl-prd-sales-link"
    "py-anl-prd-sales-pii-link"
    "py-anl-prd-scpro-link"
    "py-anl-prd-scpro-pii-link"
    "py-raw-prd-cstmr-link"
    "py-raw-prd-cstmr-pii-link"
    "py-raw-prd-engmt-link"
    "py-raw-prd-engmt-pii-link"
    "py-raw-prd-finan-link"
    "py-raw-prd-finan-pii-link"
    "py-raw-prd-humre-link"
    "py-raw-prd-humre-pii-link"
    "py-raw-prd-insec-link"
    "py-raw-prd-insec-pii-link"
    "py-raw-prd-intec-link"
    "py-raw-prd-intec-pii-link"
    "py-raw-prd-legal-link"
    "py-raw-prd-legal-pii-link"
    "py-raw-prd-ntwrk-link"
    "py-raw-prd-ntwrk-pii-link"
    "py-raw-prd-pdsvc-link"
    "py-raw-prd-pdsvc-pii-link"
    "py-raw-prd-pdusg-link"
    "py-raw-prd-pdusg-pii-link"
    "py-raw-prd-refer-link"
    "py-raw-prd-refer-pii-link"
    "py-raw-prd-regul-link"
    "py-raw-prd-regul-pii-link"
    "py-raw-prd-sales-link"
    "py-raw-prd-sales-pii-link"
    "py-raw-prd-scpro-link"
    "py-raw-prd-scpro-pii-link"
    "py-std-prd-cstmr-link"
    "py-std-prd-cstmr-pii-link"
    "py-std-prd-engmt-link"
    "py-std-prd-engmt-pii-link"
    "py-std-prd-finan-link"
    "py-std-prd-finan-pii-link"
    "py-std-prd-humre-link"
    "py-std-prd-humre-pii-link"
    "py-std-prd-insec-link"
    "py-std-prd-insec-pii-link"
    "py-std-prd-intec-link"
    "py-std-prd-intec-pii-link"
    "py-std-prd-legal-link"
    "py-std-prd-legal-pii-link"
    "py-std-prd-ntwrk-link"
    "py-std-prd-ntwrk-pii-link"
    "py-std-prd-pdsvc-link"
    "py-std-prd-pdsvc-pii-link"
    "py-std-prd-pdusg-link"
    "py-std-prd-pdusg-pii-link"
    "py-std-prd-refer-link"
    "py-std-prd-refer-pii-link"
    "py-std-prd-regul-link"
    "py-std-prd-regul-pii-link"
    "py-std-prd-sales-link"
    "py-std-prd-sales-pii-link"
    "py-std-prd-scpro-link"
    "py-std-prd-scpro-pii-link"
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
        # --principal DataLakePrincipalIdentifier=arn:aws:iam::579325186151:user/power-bi-simon-bustamante-pa-athena-access-dev \
        # --permissions "DESCRIBE" \
        # --resource '{ "LFTag": { "CatalogId": "'$MAINCATALOGID'", "TagKey": "Environment", "TagValues": ["*"] }}' \
        # --profile "579325186151_AWSAdministratorAccess"


        echo "Granted DEV DESCRIBE  permissions on '$DB' for '$user'"
    done
done

