# Configuración del Cluster de EKS

Para acceder a esta aplicación acceda a [Weather App](http://k8s-default-nginxing-1a8e43ab6b-1507565340.us-east-1.elb.amazonaws.com/) 

## Herramientas necesarias

1. Cluster configurado y listo en AWS.
2. Credenciales de acceso para acceder al cluster de EKS.
3. Configurar rol en el archivo service-account.yaml

## Proceso de configuración y despliegue

Una vez que tengas acceso al cluster, sigue estos pasos para configurar y desplegar las aplicaciones:

### Conectarse al Cluster

```bash
aws eks update-kubeconfig --region XXXXX --name weather-cluster
```

### Aplicar configuraciones

- Aplicar Service Account:
```bash
kubectl apply -f service-account.yaml
```

- Instalar Cert-Manager:
```bash
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.12.3/cert-manager.yaml

```
- Aplicar la configuración del controlador de balanceo de carga:
```bash
kubectl apply -f v2_8_1_full.yaml
```

- Aplicar la configuración de la clase de Ingress:
```bash
kubectl apply -f v2_8_1_ingclass.yaml
```

- Desplegar la aplicación:
```bash
kubectl apply -f app-deployment.yaml
```

### Verificar la configuración

Para verificar que todo está configurado correctamente, describe el ingress para ver su estado y verificar que no hay errores:
```bash
kubectl describe ingress app-ingress
```

El DNS se obtendrá con el anterior comando desde donde podrá acceder a la app.

Referencias:

- [Creating a role using custom trust policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-custom.html)

- [Create an IAM OIDC provider for your cluster](https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html)

- [Route application and HTTP traffic with Application Load Balancers](https://docs.aws.amazon.com/eks/latest/userguide/alb-ingress.html)

- [AWS Load Balancer Controller installation](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.8/deploy/installation/)

- [What is the AWS Load Balancer Controller?](https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html)