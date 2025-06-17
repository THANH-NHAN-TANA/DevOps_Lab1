package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestEc2Creation(t *testing.T) {
    terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
        TerraformDir: "../environments/dev",
    })

    defer terraform.Destroy(t, terraformOptions)
    terraform.InitAndApply(t, terraformOptions)

    publicInstanceId := terraform.Output(t, terraformOptions, "public_instance_id")
    privateInstanceId := terraform.Output(t, terraformOptions, "private_instance_id")

    assert.NotEmpty(t, publicInstanceId)
    assert.NotEmpty(t, privateInstanceId)
}
