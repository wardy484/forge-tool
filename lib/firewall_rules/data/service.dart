enum Service implements Comparable<Service> {
  http(ports: ["80", "443"]),
  mysql(ports: ["3306"]),
  ssh(ports: ["22"]),
  redis(ports: ['6379']),
  meilisearch(ports: ['7700']);

  const Service({
    required this.ports,
  });

  final List<String> ports;

  String get label {
    switch (this) {
      case Service.http:
        return "HTTP";
      case Service.mysql:
        return "MySQL";
      case Service.ssh:
        return "SSH";
      case Service.redis:
        return "Redis";
      case Service.meilisearch:
        return "Meilisearch";
    }
  }

  @override
  int compareTo(Service other) => index.compareTo(other.index);
}
