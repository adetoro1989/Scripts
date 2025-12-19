# Install graphviz if not already installed:
# pip install graphviz

from graphviz import Digraph

# Build AWS-style architecture diagram
dot = Digraph("AWS_VPC", format="png")
dot.attr(rankdir="TB", size="10")

# Cluster for VPC
with dot.subgraph(name="cluster_vpc") as vpc:
    vpc.attr(label="VPC", style="rounded,filled", fillcolor="lightblue")

    # Public Subnets
    with vpc.subgraph(name="cluster_pub") as pub:
        pub.attr(label="Public Subnets (AZ1 & AZ2)", style="filled", fillcolor="lightyellow")
        pub.node("FE", "EC2 (Frontend)\nNginx SPA\nSG: 80/443 from Internet", shape="rectangle", style="filled", fillcolor="orange")
        pub.node("IGW", "Internet Gateway", shape="oval", style="filled", fillcolor="white")
        pub.node("NAT", "NAT Gateway", shape="oval", style="filled", fillcolor="white")

    # Private Subnets
    with vpc.subgraph(name="cluster_priv") as priv:
        priv.attr(label="Private Subnets (AZ1 & AZ2)", style="filled", fillcolor="lightgreen")
        priv.node("BE", "EC2 (Backend)\nApp Port 8000 (only FE)\nSSM Session Manager", shape="rectangle", style="filled", fillcolor="pink")
        priv.node("RDS", "Amazon RDS\nPostgreSQL\nPort 5432 (only BE)", shape="cylinder", style="filled", fillcolor="lightgrey")

# SSM Parameter Store outside VPC
dot.node("SSM", "AWS Systems Manager\nParameter Store\n(DB Password)", shape="folder", style="filled", fillcolor="white")

# Connections (with AWS-like labels)
dot.edge("IGW", "FE", label="HTTP/HTTPS (80/443)", style="dashed")
dot.edge("FE", "BE", label="App (8000)", style="dashed")
dot.edge("BE", "RDS", label="DB (5432)", style="dashed")
dot.edge("BE", "SSM", label="IAM Role fetch secret")
dot.edge("BE", "NAT", label="Outbound traffic")
dot.edge("NAT", "IGW", label="Internet")

# Save both PNG and PDF
dot.render("aws_vpc_architecture", format="png", cleanup=True)
dot.render("aws_vpc_architecture", format="pdf", cleanup=True)

print("✅ Diagrams generated: aws_vpc_architecture.png and aws_vpc_architecture.pdf")
