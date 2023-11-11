<%-- 
    Document   : report.jsp
    Created on : Nov 10, 2023, 11:13:20 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="container mt-5">
            <form method="post" action="" onsubmit="return validateForm();">
                <div class="mb-3 text-center">
                    <h2>Report An Issue</h2>
                </div>

                <div class="mb-3">
                    <label for="data_2" class="form-label">Reported by<span style="color: red;"> *</span></label>
                    <input type="text" id="data_2" name="data_2" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="data_3" class="form-label">Severity</label>
                    <select id="data_3" name="data_3" class="form-select">
                        <option>Critical</option>
                        <option>Major</option>
                        <option>Moderate</option>
                        <option>Minor</option>
                        <option>Cosmetic</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="data_4" class="form-label">Priority</label>
                    <select id="data_4" name="data_4" class="form-select">
                        <option>Low</option>
                        <option>Medium</option>
                        <option>High</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="data_5" class="form-label">Reproducibility</label>
                    <select id="data_5" name="data_5" class="form-select">
                        <option>10%</option>
                        <option>25%</option>
                        <option>50%</option>
                        <option>75%</option>
                        <option>100%</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="data_6" class="form-label">Summary<span style="color: red;"> *</span></label>
                    <input type="text" id="data_6" name="data_6" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="data_7" class="form-label">Description</label>
                    <textarea id="data_7" name="data_7" rows="6" class="form-control"></textarea>
                </div>

                <div class="mb-3 text-center">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>

        <!-- Bootstrap JS and Popper.js (optional) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                function validateForm() {
                    if (isEmpty(document.getElementById('data_2').value.trim())) {
                        alert('Reported by is required!');
                        return false;
                    }
                    if (isEmpty(document.getElementById('data_6').value.trim())) {
                        alert('Summary is required!');
                        return false;
                    }
                    return true;
                }

                function isEmpty(str) {
                    return str.length === 0 || !str.trim();
                }
        </script>

    </body>
</html>
