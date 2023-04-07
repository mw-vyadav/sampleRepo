function plan = buildfile
import matlab.buildtool.Task
% Create a plan with no tasks
plan = buildplan;

% Create the "check" task and add it to the plan
plan("check") = Task( ...
    Description="Identify code issues", ...
    Actions=@check);

% Create the "test" task and add it to the plan
plan("test") = Task( ...
    Description="Run unit tests", ...
    Actions=@test);

% Make the "test" task the default task in the plan
plan.DefaultTasks = "test";
end

% Helper functions
function check(~)
issues = codeIssues;
assert(isempty(issues.Issues),formattedDisplayText( ...
    issues.Issues(:,["Location" "Severity" "Description"])))
end

function test(~)
results = runtests(IncludeSubfolders=true,OutputDetail="terse");
assertSuccess(results);
end