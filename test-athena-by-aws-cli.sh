#!/bin/bash

# Define la consulta SQL y la ubicación en S3 donde almacenar los resultados
QUERY_STRING="SELECT * FROM \"pa-anl-dev-cstmr-link\".\"s3_pa_anl_dev_cstmr\""
OUTPUT_LOCATION="s3://athena-output-ds-dev/"
PROFILE="power-bi-simon-bustamante-pa-athena-access-dev"

# Iniciar la ejecución de la consulta en Athena
QUERY_EXECUTION_ID=$(aws athena start-query-execution \
  --query-string "$QUERY_STRING" \
  --result-configuration OutputLocation="$OUTPUT_LOCATION" \
  --query "QueryExecutionId" \
  --output text)

# Comprobar si el comando fue exitoso
if [ -z "$QUERY_EXECUTION_ID" ]; then
  echo "Failed to start query execution."
  exit 1
fi

echo "Query started. Query Execution ID: $QUERY_EXECUTION_ID"

# Inicializar el estado de la consulta como 'RUNNING'
QUERY_STATUS="RUNNING"

# Esperar a que la consulta se complete
while [ "$QUERY_STATUS" == "RUNNING" ]; do
  QUERY_STATUS=$(aws athena get-query-execution \
    --query-execution-id "$QUERY_EXECUTION_ID" \
    --query "QueryExecution.Status.State" \
    --output text)

  # Esperar unos segundos antes de la próxima comprobación de estado
  sleep 5
done

# Comprobar si la consulta se completó con éxito
if [ "$QUERY_STATUS" == "SUCCEEDED" ]; then
  echo "Query succeeded. Retrieving results..."
  
  # Obtener los resultados de la consulta
  aws athena get-query-results \
    --query-execution-id "$QUERY_EXECUTION_ID" \
    --output json
    --profile $PROFILE
  
else
  echo "Query failed with status: $QUERY_STATUS"
  exit 1
fi
