package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestSecurityGroupCreation(t *testing.T) {
    terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
        TerraformDir: "../environments/dev",
    })

    defer terraform.Destroy(t, terraformOptions)
    terraform.InitAndApply(t, terraformOptions)

    publicSgId := terraform.Output(t, terraformOptions, "public_sg_id")
    privateSgId := terraform.Output(t, terraformOptions, "private_sg_id")

    assert.NotEmpty(t, publicSgId)
    assert.NotEmpty(t, privateSgId)
}
