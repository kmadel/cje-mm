import jenkins.model.Jenkins;
import nectar.plugins.rbac.strategy.*;
import hudson.security.*;
import nectar.plugins.rbac.groups.*;
import nectar.plugins.rbac.roles.*;

import java.util.logging.Logger

Logger logger = Logger.getLogger("init_05_rbac.groovy")

def j = Jenkins.instance

File disableScript = new File(j.rootDir, ".disable-init_05_rbac")
if (disableScript.exists()) {//only run once
    logger.info("DISABLED init_05_rbac script")
    return
}

def env = System.getenv()

if( env['DEV_GROUP'] != null || env['ADMIN_GROUP'] != null ) {
    def adminRole = "master-admin"
    def adminGroupName = "master_admins"
    def devRole = "develop"
    def devGroupNames = "master-devs"
    GroupContainer container = GroupContainerLocator.locate(j)
    if( env['ADMIN_GROUP'] != null ) {
        Group adminGroup = new Group(container, adminGroupName)
        adminGroup.doAddMember(env['ADMIN_GROUP'])
        adminGroup.doGrantRole(adminRole, 0, Boolean.TRUE)
        container.addGroup(adminGroup)
    }
    if( env['DEV_GROUP'] != null ) {
        Group devGroup = new Group(container, devGroupName)
        devGroup.doAddMember(env['DEV_GROUP'])
        devGroup.doGrantRole(devRole, 0, Boolean.TRUE)
        container.addGroup(devGroup)
    }
}

//create marker file to disable scripts from running twice
disableScript.createNewFile()