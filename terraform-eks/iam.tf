#resource "aws_iam_role" "eks_cluster_role" {
#  name               = "eks-cluster-role"
#  assume_role_policy = jsonencode({
#    "Version" : "2012-10-17",
#    "Statement": [{
#      "Effect": "Allow",
#      "Principal": {
#        "Service": "eks.amazonaws.com"
#      },
#      "Action": "sts:AssumeRole"
#    }]
#  })
#}
#
#resource "aws_iam_policy" "eks_cluster_policy" {
#  name        = "eks-cluster-policy"
#  description = "Policy for managing Amazon EKS clusters"
#
#  policy = jsonencode({
#    "Version": "2012-10-17",
#    "Statement": [{
#      "Effect": "Allow",
#      "Action": [
#        "eks:DescribeCluster",
#        "eks:ListNodegroups",
#        "eks:DescribeNodegroup",
#        "eks:CreateNodegroup",
#        "eks:UpdateNodegroupConfig",
#        "eks:DeleteNodegroup",
#        "eks:TagResource",
#        "eks:UntagResource"
#      ],
#      "Resource": "*"
#    }]
#  })
#}
#
#resource "aws_iam_role_policy_attachment" "eks_cluster_role_attachment" {
#  role       = aws_iam_role.eks_cluster_role.name
#  policy_arn = aws_iam_policy.eks_cluster_policy.arn
#}
