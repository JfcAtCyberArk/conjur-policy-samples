# conjur-policy-samples

Sample policy files (yaml) to setup a demo organisation in Conjur

## Getting Started

The idea here is to organize your policies as a filesystem so that it reflects the Conjur arborescence.

https://conjur.org

### Example

```
-root.yml
-node1.yml
-node2.yml
-node1/
  |-node1-1/
    |-...
  |-node1-2/
    |-...
  |-node1-1.yml
  |-node1-2.yml
-node2/
  |-node2-1/
  |-node2-2/
  |-node2-1.yml
  |-node2-2.yml
```

Then policies can be loaded this way: 
```
conjur policy load root root.yml
conjur policy load node1 node1.yml
conjur policy load node2 node2.yml
conjur policy load node1/node1-1 node1/node1-1.yml
conjur policy load node1/node1-2 node1/node1-2.yml
conjur policy load node2/node2-1 node2/node2-1.yml
conjur policy load node2/node2-2 node2/node2-2.yml
etc.
```

### Best practice

A best practice is to declare a child policy in its parent policy, for instance:

  - root.yml
```
...
- !policy
  id: node1
  owner: !group admin
- !policy
  id: node2
  owner: !group admin 
...
```
  - node1.yml
```
<body>
- !policy
  id: node1-1
  owner: !group node1_admins
- !policy 
  id: node 1-2
  owner: !group node1_admins
```

This way, each child policy is known from the parent. 

Then the policy can be defined in the policy file. 

### To sum up: 

Policies are stored in folders that match Conjur policies arborescence.

A child policy is declared in parent.yml and defined in child.yml. 

