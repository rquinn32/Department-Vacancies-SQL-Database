Department Vacancies Database

Database Description: Di$erent departments in a company have posted vacant positions
where candidates may apply provided, they have the appropriate skills. Given this
information, tables were created regarding skills, candidate, position, department and
interview details. Stored procedures were created to allow the user to easily filter through
and navigate the database as well as add information to tables if need be.

Assumptions: Each interview involved only one candidate, one position and one
department. Salary information is not required. A candidate can interview for multiple
positions or the same position more than once.

Reaction Policies: For the candidate_skills table ON delete – cascade and ON update –
cascade policies were used. This is because if a candidate is deleted, their skills should be
deleted as well. Additionally, if the candidate id were to change, the skills should be
automatically updated as well. For position_details, the foreign key with table department
received similar policies as if a department were to be removed, it’s position should be as
well. Similarly, if a position were to be deleted, it’s skills should be too. Additionally, if the
department id changed this should be updated in positions. Lastly, for interviews ON
delete – cascade was used for candidate and position ids as the interviews linked to
positions or candidates removed, should be removed as well.

Operating system: macOS
