resource "aws_iam_role" "salemrole" {
  name               = "salemrole"
  assume_role_policy = "${file("assumerolepolicy.json")}"
}

resource "aws_iam_policy" "tesst-policy" {
  name        = "tesst-policy"
  description = "A tesst-policy"
  policy      = "${file("policy.json")}"
}

resource "aws_iam_policy_attachment" "tesst-attach" {
  name       = "tesst-attachment"
  roles      = ["${aws_iam_role.salemrole.name}"]
  policy_arn = "${aws_iam_policy.tesst-policy.arn}"
}

resource "aws_iam_instance_profile" "salem" {
  name  = "salem"
  role = "${aws_iam_role.salemrole.name}"


}

