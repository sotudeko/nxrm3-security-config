---
- name: Calling Groovy script {{ script_name }}
  uri:
    url: "{{ nxrm3_item.host }}:{{ nxrm3_item.port }}/service/rest/v1/script/{{ script_name }}/run"
    user: "{{ nxrm3_item.user }}"
    password: "{{ nxrm3_item.passwd }}"
    headers:
      Content-Type: "text/plain"
    method: POST
    status_code: 200,204
    force_basic_auth: yes
    body: "{{ item | to_json }}"
  loop: "{{ nxrm3_instances }}"
  loop_control:
     loop_var: nxrm3_item
  register: op

- debug:
    var: op

