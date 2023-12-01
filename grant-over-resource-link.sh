#!/bin/bash

# Definir la lista de usuarios
PROFILE="579325186151_AWSAdministratorAccess"
PROFILEUAT="655235974679_AWSAdministratorAccess"
PROFILEPRD="981625247045_AWSAdministratorAccess"
users=(
    "power-bi-lourdes-laguna-pa-athena-access-dev"
    "power-bi-simon-bustamante-pa-athena-access-dev"
    "power-bi-lourdes-laguna-pa-athena-access-dev"
    "power-bi-carlos-ovalle-pa-athena-access-dev"
)
usersuat=(
    "power-bi-lourdes-laguna-pa-athena-access-uat"
    "power-bi-simon-bustamante-pa-athena-access-uat"
    "power-bi-lourdes-laguna-pa-athena-access-uat"
    "power-bi-carlos-ovalle-pa-athena-access-uat"
)
usersprd=(
    "power-bi-lourdes-laguna-pa-athena-access-prd"
    "power-bi-simon-bustamante-pa-athena-access-prd"
    "power-bi-lourdes-laguna-pa-athena-access-prd"
    "power-bi-carlos-ovalle-pa-athena-access-prd"
)
ACCOUNTID="579325186151"
ACCOUNTIDUAT="655235974679"
ACCOUNTIDPRD="981625247045"
MAINCATALOGID="302754896336"

DBS=(
    "pa-anl-dev-cstmr-link"
    "pa-anl-dev-cstmr-pii-link"
    "pa-anl-dev-engmt-link"
    "pa-anl-dev-engmt-pii-link"
    "pa-anl-dev-finan-link"
    "pa-anl-dev-finan-pii-link"
    "pa-anl-dev-humre-link"
    "pa-anl-dev-humre-pii-link"
    "pa-anl-dev-insec-link"
    "pa-anl-dev-insec-pii-link"
    "pa-anl-dev-intec-link"
    "pa-anl-dev-intec-pii-link"
    "pa-anl-dev-legal-link"
    "pa-anl-dev-legal-pii-link"
    "pa-anl-dev-ntwrk-link"
    "pa-anl-dev-ntwrk-pii-link"
    "pa-anl-dev-pdsvc-link"
    "pa-anl-dev-pdsvc-pii-link"
    "pa-anl-dev-pdusg-link"
    "pa-anl-dev-pdusg-pii-link"
    "pa-anl-dev-refer-link"
    "pa-anl-dev-refer-pii-link"
    "pa-anl-dev-regul-link"
    "pa-anl-dev-regul-pii-link"
    "pa-anl-dev-sales-link"
    "pa-anl-dev-sales-pii-link"
    "pa-anl-dev-scpro-link"
    "pa-anl-dev-scpro-pii-link"
    "pa-raw-dev-cstmr-link"
    "pa-raw-dev-cstmr-pii-link"
    "pa-raw-dev-engmt-link"
    "pa-raw-dev-engmt-pii-link"
    "pa-raw-dev-finan-link"
    "pa-raw-dev-finan-pii-link"
    "pa-raw-dev-humre-link"
    "pa-raw-dev-humre-pii-link"
    "pa-raw-dev-insec-link"
    "pa-raw-dev-insec-pii-link"
    "pa-raw-dev-intec-link"
    "pa-raw-dev-intec-pii-link"
    "pa-raw-dev-legal-link"
    "pa-raw-dev-legal-pii-link"
    "pa-raw-dev-ntwrk-link"
    "pa-raw-dev-ntwrk-pii-link"
    "pa-raw-dev-pdsvc-link"
    "pa-raw-dev-pdsvc-pii-link"
    "pa-raw-dev-pdusg-link"
    "pa-raw-dev-pdusg-pii-link"
    "pa-raw-dev-refer-link"
    "pa-raw-dev-refer-pii-link"
    "pa-raw-dev-regul-link"
    "pa-raw-dev-regul-pii-link"
    "pa-raw-dev-sales-link"
    "pa-raw-dev-sales-pii-link"
    "pa-raw-dev-scpro-link"
    "pa-raw-dev-scpro-pii-link"
    "pa-std-dev-cstmr-link"
    "pa-std-dev-cstmr-pii-link"
    "pa-std-dev-engmt-link"
    "pa-std-dev-engmt-pii-link"
    "pa-std-dev-finan-link"
    "pa-std-dev-finan-pii-link"
    "pa-std-dev-humre-link"
    "pa-std-dev-humre-pii-link"
    "pa-std-dev-insec-link"
    "pa-std-dev-insec-pii-link"
    "pa-std-dev-intec-link"
    "pa-std-dev-intec-pii-link"
    "pa-std-dev-legal-link"
    "pa-std-dev-legal-pii-link"
    "pa-std-dev-ntwrk-link"
    "pa-std-dev-ntwrk-pii-link"
    "pa-std-dev-pdsvc-link"
    "pa-std-dev-pdsvc-pii-link"
    "pa-std-dev-pdusg-link"
    "pa-std-dev-pdusg-pii-link"
    "pa-std-dev-refer-link"
    "pa-std-dev-refer-pii-link"
    "pa-std-dev-regul-link"
    "pa-std-dev-regul-pii-link"
    "pa-std-dev-sales-link"
    "pa-std-dev-sales-pii-link"
    "pa-std-dev-scpro-link"
    "pa-std-dev-scpro-pii-link"
)

DBSUAT=(
    "pa-anl-uat-cstmr-link"
    "pa-anl-uat-cstmr-pii-link"
    "pa-anl-uat-engmt-link"
    "pa-anl-uat-engmt-pii-link"
    "pa-anl-uat-finan-link"
    "pa-anl-uat-finan-pii-link"
    "pa-anl-uat-humre-link"
    "pa-anl-uat-humre-pii-link"
    "pa-anl-uat-insec-link"
    "pa-anl-uat-insec-pii-link"
    "pa-anl-uat-intec-link"
    "pa-anl-uat-intec-pii-link"
    "pa-anl-uat-legal-link"
    "pa-anl-uat-legal-pii-link"
    "pa-anl-uat-ntwrk-link"
    "pa-anl-uat-ntwrk-pii-link"
    "pa-anl-uat-pdsvc-link"
    "pa-anl-uat-pdsvc-pii-link"
    "pa-anl-uat-pdusg-link"
    "pa-anl-uat-pdusg-pii-link"
    "pa-anl-uat-refer-link"
    "pa-anl-uat-refer-pii-link"
    "pa-anl-uat-regul-link"
    "pa-anl-uat-regul-pii-link"
    "pa-anl-uat-sales-link"
    "pa-anl-uat-sales-pii-link"
    "pa-anl-uat-scpro-link"
    "pa-anl-uat-scpro-pii-link"
    "pa-raw-uat-cstmr-link"
    "pa-raw-uat-cstmr-pii-link"
    "pa-raw-uat-engmt-link"
    "pa-raw-uat-engmt-pii-link"
    "pa-raw-uat-finan-link"
    "pa-raw-uat-finan-pii-link"
    "pa-raw-uat-humre-link"
    "pa-raw-uat-humre-pii-link"
    "pa-raw-uat-insec-link"
    "pa-raw-uat-insec-pii-link"
    "pa-raw-uat-intec-link"
    "pa-raw-uat-intec-pii-link"
    "pa-raw-uat-legal-link"
    "pa-raw-uat-legal-pii-link"
    "pa-raw-uat-ntwrk-link"
    "pa-raw-uat-ntwrk-pii-link"
    "pa-raw-uat-pdsvc-link"
    "pa-raw-uat-pdsvc-pii-link"
    "pa-raw-uat-pdusg-link"
    "pa-raw-uat-pdusg-pii-link"
    "pa-raw-uat-refer-link"
    "pa-raw-uat-refer-pii-link"
    "pa-raw-uat-regul-link"
    "pa-raw-uat-regul-pii-link"
    "pa-raw-uat-sales-link"
    "pa-raw-uat-sales-pii-link"
    "pa-raw-uat-scpro-link"
    "pa-raw-uat-scpro-pii-link"
    "pa-std-uat-cstmr-link"
    "pa-std-uat-cstmr-pii-link"
    "pa-std-uat-engmt-link"
    "pa-std-uat-engmt-pii-link"
    "pa-std-uat-finan-link"
    "pa-std-uat-finan-pii-link"
    "pa-std-uat-humre-link"
    "pa-std-uat-humre-pii-link"
    "pa-std-uat-insec-link"
    "pa-std-uat-insec-pii-link"
    "pa-std-uat-intec-link"
    "pa-std-uat-intec-pii-link"
    "pa-std-uat-legal-link"
    "pa-std-uat-legal-pii-link"
    "pa-std-uat-ntwrk-link"
    "pa-std-uat-ntwrk-pii-link"
    "pa-std-uat-pdsvc-link"
    "pa-std-uat-pdsvc-pii-link"
    "pa-std-uat-pdusg-link"
    "pa-std-uat-pdusg-pii-link"
    "pa-std-uat-refer-link"
    "pa-std-uat-refer-pii-link"
    "pa-std-uat-regul-link"
    "pa-std-uat-regul-pii-link"
    "pa-std-uat-sales-link"
    "pa-std-uat-sales-pii-link"
    "pa-std-uat-scpro-link"
    "pa-std-uat-scpro-pii-link"
)

DBSPRD=(
    "pa-anl-prd-cstmr-link"
    "pa-anl-prd-cstmr-pii-link"
    "pa-anl-prd-engmt-link"
    "pa-anl-prd-engmt-pii-link"
    "pa-anl-prd-finan-link"
    "pa-anl-prd-finan-pii-link"
    "pa-anl-prd-humre-link"
    "pa-anl-prd-humre-pii-link"
    "pa-anl-prd-insec-link"
    "pa-anl-prd-insec-pii-link"
    "pa-anl-prd-intec-link"
    "pa-anl-prd-intec-pii-link"
    "pa-anl-prd-legal-link"
    "pa-anl-prd-legal-pii-link"
    "pa-anl-prd-ntwrk-link"
    "pa-anl-prd-ntwrk-pii-link"
    "pa-anl-prd-pdsvc-link"
    "pa-anl-prd-pdsvc-pii-link"
    "pa-anl-prd-pdusg-link"
    "pa-anl-prd-pdusg-pii-link"
    "pa-anl-prd-refer-link"
    "pa-anl-prd-refer-pii-link"
    "pa-anl-prd-regul-link"
    "pa-anl-prd-regul-pii-link"
    "pa-anl-prd-sales-link"
    "pa-anl-prd-sales-pii-link"
    "pa-anl-prd-scpro-link"
    "pa-anl-prd-scpro-pii-link"
    "pa-raw-prd-cstmr-link"
    "pa-raw-prd-cstmr-pii-link"
    "pa-raw-prd-engmt-link"
    "pa-raw-prd-engmt-pii-link"
    "pa-raw-prd-finan-link"
    "pa-raw-prd-finan-pii-link"
    "pa-raw-prd-humre-link"
    "pa-raw-prd-humre-pii-link"
    "pa-raw-prd-insec-link"
    "pa-raw-prd-insec-pii-link"
    "pa-raw-prd-intec-link"
    "pa-raw-prd-intec-pii-link"
    "pa-raw-prd-legal-link"
    "pa-raw-prd-legal-pii-link"
    "pa-raw-prd-ntwrk-link"
    "pa-raw-prd-ntwrk-pii-link"
    "pa-raw-prd-pdsvc-link"
    "pa-raw-prd-pdsvc-pii-link"
    "pa-raw-prd-pdusg-link"
    "pa-raw-prd-pdusg-pii-link"
    "pa-raw-prd-refer-link"
    "pa-raw-prd-refer-pii-link"
    "pa-raw-prd-regul-link"
    "pa-raw-prd-regul-pii-link"
    "pa-raw-prd-sales-link"
    "pa-raw-prd-sales-pii-link"
    "pa-raw-prd-scpro-link"
    "pa-raw-prd-scpro-pii-link"
    "pa-std-prd-cstmr-link"
    "pa-std-prd-cstmr-pii-link"
    "pa-std-prd-engmt-link"
    "pa-std-prd-engmt-pii-link"
    "pa-std-prd-finan-link"
    "pa-std-prd-finan-pii-link"
    "pa-std-prd-humre-link"
    "pa-std-prd-humre-pii-link"
    "pa-std-prd-insec-link"
    "pa-std-prd-insec-pii-link"
    "pa-std-prd-intec-link"
    "pa-std-prd-intec-pii-link"
    "pa-std-prd-legal-link"
    "pa-std-prd-legal-pii-link"
    "pa-std-prd-ntwrk-link"
    "pa-std-prd-ntwrk-pii-link"
    "pa-std-prd-pdsvc-link"
    "pa-std-prd-pdsvc-pii-link"
    "pa-std-prd-pdusg-link"
    "pa-std-prd-pdusg-pii-link"
    "pa-std-prd-refer-link"
    "pa-std-prd-refer-pii-link"
    "pa-std-prd-regul-link"
    "pa-std-prd-regul-pii-link"
    "pa-std-prd-sales-link"
    "pa-std-prd-sales-pii-link"
    "pa-std-prd-scpro-link"
    "pa-std-prd-scpro-pii-link"
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

for DB in "${DBSUAT[@]}"; do
    for user in "${usersuat[@]}"; do
         # Otorgar permiso DESCRIBE en la base de datos
        aws lakeformation grant-permissions \
            --principal DataLakePrincipalIdentifier=arn:aws:iam::$ACCOUNTIDUAT:user/power-bi-users/$user \
            --permissions "DESCRIBE" \
            --resource '{"Database":{"Name": "'$DB'"}}' \
            --profile $PROFILEUAT

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


        echo "Granted UAT DESCRIBE  permissions on '$DB' for '$user'"
    done
done

for DB in "${DBSPRD[@]}"; do
    for user in "${usersprd[@]}"; do
         # Otorgar permiso DESCRIBE en la base de datos
        aws lakeformation grant-permissions \
            --principal DataLakePrincipalIdentifier=arn:aws:iam::$ACCOUNTIDPRD:user/power-bi-users/$user \
            --permissions "DESCRIBE" \
            --resource '{"Database":{"Name": "'$DB'"}}' \
            --profile $PROFILEPRD

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


        echo "Granted PRD DESCRIBE  permissions on '$DB' for '$user'"
    done
done