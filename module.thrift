#!/usr/bin/thrift --gen py:twisted

# Copyright (C) 2005-2010  MISG/ICTI/EIA-FR
# See LICENSE for details.


include "types.thrift"
include "errors.thrift"


namespace py smaclib.api.module


service Module {
    /** Simple online checking mechanism */
    bool ping()
    
    /** Returns the unique ID of this module on the whole smac network */
    types.ModuleID getID()
    
    /** Restarts the receiving module */
    oneway void restart()
    
    /** Shuts down the receiving module */
    oneway void shutdown()
    
    list<types.TaskStatus> getAllTasks()
    
    types.TaskStatus getTask(1: types.TaskID task_id)
                      throws (1: errors.TaskNotFound invalid_task)
    
    void abortTask(1: types.TaskID task_id)
            throws (1: errors.TaskNotFound invalid_task,
                    2: errors.OperationNotSupported invalid_op)
    
    /** Returns true if the task was running */
    bool pauseTask(1: types.TaskID task_id)
            throws (1: errors.TaskNotFound invalid_task,
                    2: errors.OperationNotSupported invalid_op)
    
    /** Returns true if the task was paused */
    bool resumeTask(1: types.TaskID task_id)
             throws (1: errors.TaskNotFound invalid_task,
                     2: errors.OperationNotSupported invalid_op)
}
