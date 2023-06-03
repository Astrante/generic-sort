## Create Scratch Org Instruction

1) Login to DevHub if not logged in. Use your own developer account. In this account must be enabled dev hub feature. For enable Dev Hub got to Setup > Dev Hub

    ```sh
    sf org login web -d -a devHubAlias
    ```

    If you already logged in to devHub you can set this devHub as default with command:

    ```sh
    sf config set target-dev-hub=devHubAlias
    ```

2) Create Scratch Org

   ```sh
   sf org create scratch --definition-file config/project-scratch-def.json --duration-days 30 --set-default --alias generic-sort
   ```

3) Push project to scratch org
   
    ```sh
    sf project deploy start
    ```
   
4) You are ready for test or update GenericSort in your scratch org!

**Full list of SF commands:** https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_org_commands_unified.htm
