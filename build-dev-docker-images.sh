./mvnw clean package
docker build --force-rm -t "web-admin-server:dev" ./web-admin-server
docker build --force-rm -t "web-api-gateway:dev" ./web-api-gateway
docker build --force-rm -t "web-config-server:dev" ./web-config-server
docker build --force-rm -t "web-customers-service:dev" ./web-customers-service
docker build --force-rm -t "web-discovery-server:dev" ./web-discovery-server
docker build --force-rm -t "web-hystrix-dashboard:dev" ./web-hystrix-dashboard
docker build --force-rm -t "web-vets-service:dev" ./web-vets-service
docker build --force-rm -t "web-visits-service:dev" ./web-visits-service
docker build --force-rm -t "web-grafana-server:dev" ./docker/grafana
docker build --force-rm -t "web-prometheus-server:dev" ./docker/prometheus