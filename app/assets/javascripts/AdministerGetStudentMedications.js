// accepts an array of StudentMedication objects in json format
const updateStudentMedications = (student_medications_json) => {

    const student_medication_select = $("#select_student_medication")
    student_medication_select.empty();
    if (student_medications_json.length !== 0) { // hide the student medications field if the student doesnt have any medications
        // maps through the student medications json array, creates an array of <option> html elements
        // that each have the medication name as their text and medication id as their value
        const student_medication_options = student_medications_json.map(med => {
            let option = document.createElement("option");
            option.text = med.medication_name;
            option.value = med.id;

            return option
        });

        // add a prompt for student medications in case the nurse doesn't want to select one
        student_medication_select.append("<option>Select a student-specific medication</option>")

        // put all the previously created <option> elements into the student medication select tag
        student_medication_select.append(student_medication_options);
        $("#student-medication-section").show();
    } else {
        $("#student-medication-section").hide();
    }
}

$("#student-medication-section").hide(); // hide student medications initially

$("#select_student").change((event) => {
    let student_id = event.target.value;

    // check that student_id is not empty in case the prompt is selected again
    if (student_id) {
        $.ajax({
            url: `/student_medications/student/${student_id}`,
            success: updateStudentMedications
        })
    } else {
        $("#student-medication-section").hide(); // hide student medications if prompt is selected
    }
})
