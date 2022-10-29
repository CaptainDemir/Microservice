echo 'Deploying App on Kubernetes'
envsubst < k8s/webservices_chart/values-template.yaml > k8s/webservices_chart/values.yaml
sed -i s/HELM_VERSION/${BUILD_NUMBER}/ k8s/webservices_chart/Chart.yaml
AWS_REGION=$AWS_REGION helm repo add stable-web s3://web-helm-charts-demir/stable/myapp/ || echo "repository name already exists"
AWS_REGION=$AWS_REGION helm repo update
helm package k8s/webservices_chart
AWS_REGION=$AWS_REGION helm s3 push webservices_chart-${BUILD_NUMBER}.tgz stable-web
envsubst < ansible/playbooks/qa-petclinic-deploy-template >ansible/playbooks/qa-petclinic-deploy.yaml
ansible-playbook -i ./ansible/inventory/qa_stack_dynamic_inventory_aws_ec2.yaml ./ansible/playbooks/qa-petclinic-deploy.yaml