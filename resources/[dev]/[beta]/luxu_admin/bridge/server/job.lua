--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
---@class ESXJob
---@field name string
---@field label string
---@field grades table<number, ESXJobGrade>

---@class ESXJobGrade
---@field name string
---@field label string
---@field salary number
---@field skin_male table
---@field skin_femail table
---@field id number


---@class QBJob
---@field name string
---@field label string
---@field type string
---@field defaultDuty boolean
---@field offDutyPay boolean
---@field grades QbJobGrade[]


---@class QBJobRaw
---@field grades table<number, {name: string, payment: number, isboss: boolean?}>
---@field defaultDuty boolean
---@field offDutyPay boolean
---@field label string
---@field type string


---@class QBJobGrade
---@field name string
---@field payment number
---@field isBoss boolean

---@alias QBJobs table<string, table<string, QBJobGrade>> table

--[[
example qb job
police = {
    label = 'Law Enforcement',
    type = 'leo',
    defaultDuty = true,
    offDutyPay = false,
    grades = {
        ['0'] = { name = 'Recruit', payment = 50 },
        ['1'] = { name = 'Officer', payment = 75 },
        ['2'] = { name = 'Sergeant', payment = 100 },
        ['3'] = { name = 'Lieutenant', payment = 125 },
        ['4'] = { name = 'Chief', isboss = true, payment = 150 },
    },
},
 ]]


---@class LuxuJob
---@field name string
---@field label string
---@field grades LuxuJobGrade[]




---@class JobManager
local JobManager = {}

--- Add a job
function JobManager.addJob(job)
    if Framework.name == "esx" then
        ESX.CreateJob(name, label, grades)
    elseif Framework.name == "qb" or Framework.name == "qbx" then
        exports["qb-core"]:AddJob(job)
    elseif Framework.name == "ox" then
        --TODO: Add ox_core job
    end
end

--- Remove a job
---@param jobName string
function JobManager.removeJob(jobName)
    if Framework.name == "esx" then

    elseif Framework.name == "qb" or Framework.name == "qbx" then
        exports["qb-core"]:RemoveJob(jobName)
    elseif Framework.name == "ox" then
        --TODO: Add ox_core job
    end
end

--- Add multiple jobs at once
function JobManager.addJobs(jobs)
    if Framework.name == "esx" then
        for jobName, job in pairs(jobs) do
            ESX.CreateJob(jobName, job.label, job.grades)
        end
    elseif Framework.name == "qb" or Framework.name == "qbx" then
        exports["qb-core"]:AddJobs(jobs)
    elseif Framework.name == "ox" then
        --TODO: Add ox_core job
    end
end

---@class FormattedJob
---@field name string
---@field label string
---@field grades {name:string, label:string, grade:number, isBoss:boolean, payment:number}[]

---@return FormattedJob[]
function JobManager.getJobs()
    if Framework.name == "esx" then
        local jobs = ESX.GetJobs() --[[ @as  table<string, ESXJob> ]]

        ---@type FormattedJob[]
        local formattedJobs = {}
        for jobName, job in pairs(jobs) do
            local formattedGrades = {}
            for gradeId, grade in pairs(job.grades or {}) do
                table.insert(formattedGrades, {
                    name = grade.name or "",
                    label = grade.label or "",
                    grade = gradeId,
                    isBoss = Luxu.array.includes(Config.esx_boss_grades_names, grade.name),
                    payment = grade.salary or 0,
                })
            end
            table.insert(formattedJobs, {
                name = jobName,
                label = job.label or "",
                grades = formattedGrades,
            })
        end
        return formattedJobs
    elseif Framework.name == "qb" or Framework.name == "qbx" then
        local jobs = Framework.object.Shared.Jobs --[[ @as table<string, QBJobRaw> ]]
        ---@type FormattedJob[]
        local formattedJobs = {}
        for jobName, job in pairs(jobs) do
            local formattedGrades = {}
            for gradeId, grade in pairs(job.grades or {}) do
                table.insert(formattedGrades, {
                    name = grade.name or tostring(gradeId),
                    label = grade.name or "",
                    grade = tonumber(gradeId) or 0,
                    isBoss = grade.isboss == true,
                    payment = grade.payment or 0,
                })
            end
            table.insert(formattedJobs, {
                name = jobName,
                label = job.label or "",
                grades = formattedGrades,
            })
        end
        return formattedJobs
    elseif Framework.name == "ox" then
        --TODO: Add ox_core job
    end
end

return JobManager

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
