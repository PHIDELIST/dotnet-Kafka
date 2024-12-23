#!/bin/bash

WORK_DIR=$(pwd)

echo "Installing kafka-python dependencies..."

echo "Installing kafka-python for Consumer Lambda..."
pip install kafka-python -t "$WORK_DIR/aws/lambda/consumer"
echo "Installing kafka-python for Producer Lambda..."
pip install kafka-python -t "$WORK_DIR/aws/lambda/producer"

echo "Zipping Consumer Lambda..."
cd "$WORK_DIR/aws/lambda/consumer"
zip -r consumer.zip consumer.py kafka/

echo "Zipping Producer Lambda..."
cd "$WORK_DIR/aws/lambda/producer"
zip -r producer.zip producer.py kafka/

echo "All zip files have been created:"
echo "1. consumer.zip"
echo "2. producer.zip"

