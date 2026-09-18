# Multi-env-deployment-aws
This repository has been created to understand and keep the proof of the multi env deployment on AWS

Following objectives achieved :--

Modularity in Terraform to create multi env (Dev,Stage.Prod) simultaneously.
Terraform state files separate for each env.

************************************************************************************************************************************
To show Modularity in Terraform to create multi env (Dev,Stage.Prod) simultaneously.
Below are Snapshots for the results :--

**Dynamo DB in Stage env :--**

<img width="1851" height="447" alt="image" src="https://github.com/user-attachments/assets/915a149a-3996-468a-9ba7-e0f0aeff911f" />

**EC2 instances creation in Stage env :--**

<img width="1896" height="292" alt="image" src="https://github.com/user-attachments/assets/f8f2cb07-3b1c-41bc-a1ea-467dc27b6e5d" />

**Dynamo DB creation in Stage env :--**

<img width="1912" height="477" alt="image" src="https://github.com/user-attachments/assets/d3c17e39-9c08-4ec2-894b-719a9f24fb57" />

***************************************************************************************************************************************

**Terraform state files are also arranged as per the env :--**

<img width="1896" height="530" alt="image" src="https://github.com/user-attachments/assets/b8458565-174f-426e-92ee-544b18dd6868" />
