# Ansible

쿠버네티스를 공부하며 수시로 VM들을 만들고 삭제했습니다. 이때 매번 쿠버네티스 설치를 하나하나 하는게 너무 귀찮아서 ansible을 사용해봤습니다.

## 사용법

### 사전 설정

앞으로 playbook을 실행할 ansibleuser를 구성합니다.

```bash
# project root 경로가 아닌 곳에서 실행
ansible-playbook -i ansible/test ansible/set_ansibleuser.yml -u ec2-user
```

### Kubernetes 변수 설정

```bash
vim roles/k8s/vars/main.yml
```

| Name | Data Type | Description |
| --- | --- | --- |
| kube_version | String | “1.23.1” (https://github.com/kubernetes/kubernetes/releases) |
| kube_container_runtime | String | “containerd” or “docker” |
| kube_proxy_mode | String | “iptables” or “ipvs” |

### 테스트

```bash
ansible-playbook site.yml --check --skip-tags k8s-pkg,docker-pkg
```

### 실행

```bash
ansible-playbook site.yml
```